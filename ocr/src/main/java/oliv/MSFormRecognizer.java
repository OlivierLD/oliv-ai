package oliv;

/*
 * See https://azure.microsoft.com/en-au/services/cognitive-services/form-recognizer/#overview
 *
 * Also see the code samples at https://westus2.dev.cognitive.microsoft.com/docs/services/form-recognizer-api-v2-preview/operations/AnalyzeLayoutAsync
 * Bottom of the page.
 */
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
//import org.apache.http.entity.mime.MultipartEntityBuilder;


import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MSFormRecognizer {

    // LOGGING_FLAG=-Djava.util.logging.config.file=./logging.properties
    private final static Logger log = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME); // BlahBlahBlah.class.getName());
    static {
        log.setLevel(Level.INFO);
    }

    private static final int MAX_RETRIEVE_LOOPS = 10;

    private static final String DEFAULT_MS_BASE_URL = "https://svformrecognizer.cognitiveservices.azure.com";
    private static final String DEFAULT_MS_OCR_KEY = "a5a78d4392fb4b159739349cc228e97f";

    private static final String SUBSCRIPTION_KEY_HEADER = "Ocp-Apim-Subscription-Key";
    private final static String OPERATION_LOCATION = "Operation-Location";

    private static class ProcessContent {

        enum ContentType {
            IMAGE_PATH, IMAGE_URL
        }

        private final ContentType contentType;
        private final String location;

        public ProcessContent(ContentType contentType, String location) {
            this.contentType = contentType;
            this.location = location;
        }

        public ContentType getContentType() {
            return contentType;
        }

        public String getLocation() {
            return location;
        }
    }

    /**
     *
     * @param fullPath From "path/to/file.ext"
     * @return "ext"
     */
    private static String findExtension(String fullPath) {
        return fullPath.substring(fullPath.lastIndexOf(".") + 1);
    }

    /**
     * Makes the 2 required requests to get to the document description.
     * @param processContent Content to process
     * @param withProxy use proxy to reach the MicroSoft site
     * @param parameterRequired add the includeTextDetails parameter to the first query. Seem to have no impact.
     * @return the json content.
     */
    private static String reachOutToMsOcrService(ProcessContent processContent, boolean withProxy, boolean parameterRequired) {

        String finalResponse = "{}";

        String msBaseUrl = DEFAULT_MS_BASE_URL;
        String msKey = DEFAULT_MS_OCR_KEY;

        /*
         * See this: https://blogs.oracle.com/oit-ces/oci-rest-api-made-simple-get-request-in-java
         *           https://www.baeldung.com/httpclient-post-http-request
         *           https://www.baeldung.com/java-httpclient-parameters?__s=avhsdu2sz8hdysjtxfi8
         */
        try {
            String firstEndPoint =
                    String.format(
                            "%s%s/formrecognizer/v2.1-preview.2/prebuilt/invoice/analyze",
                            (msBaseUrl.toLowerCase().trim().startsWith("http") ? "" : "http://"),
                            msBaseUrl.trim());
            log.info(String.format("Will connect to %s", firstEndPoint));

            HttpPost ocrRequestOne = new HttpPost(firstEndPoint);
            ocrRequestOne.setHeader(SUBSCRIPTION_KEY_HEADER, msKey.trim());

            if (parameterRequired) {
                try {
                    URI uri = new URIBuilder(ocrRequestOne.getURI())
                            .addParameter("includeTextDetails", "true")  // Apparently, no impact
                            .build();
                    ocrRequestOne.setURI(uri);
                } catch (URISyntaxException use) {
                    System.err.println("Oops:" + use.getMessage());
                }
            }

            log.info(String.format("First Request: %s", ocrRequestOne.toString()));

            if (processContent.getContentType().equals(ProcessContent.ContentType.IMAGE_URL)) {
                ocrRequestOne.setHeader(HttpHeaders.CONTENT_TYPE, ContentType.APPLICATION_JSON.getMimeType());
                // The body
                String imageURL = processContent.getLocation();
                String payload = String.format("{ \"source\": \"%s\" }", imageURL);
                log.info(String.format("Image URL: %s", payload));
                ocrRequestOne.setEntity(new StringEntity(payload));
                // For test...
                HttpEntity entity = ocrRequestOne.getEntity();
                log.info(String.format("Entity: %s", entity.toString()));
            } else if (processContent.getContentType().equals(ProcessContent.ContentType.IMAGE_PATH)) {
                ocrRequestOne.setHeader(HttpHeaders.CONTENT_TYPE, ContentType.APPLICATION_OCTET_STREAM.getMimeType());
                // The body
                try {
                    BufferedImage bImage = ImageIO.read(new File(processContent.getLocation()));
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    ImageIO.write(bImage, findExtension(processContent.getLocation()), baos);
                    byte[] bytes = baos.toByteArray();
                    ByteArrayEntity entity = new ByteArrayEntity(baos.toByteArray());
                    ocrRequestOne.setEntity(entity);
                    log.info(String.format("Ext %s, %d bytes.", findExtension(processContent.getLocation()), bytes.length));
//                MultipartEntityBuilder builder = MultipartEntityBuilder.create();
//                builder.addBinaryBody(
//                        "file", bytes, ContentType.APPLICATION_OCTET_STREAM, processContent.getLocation());
//
//                HttpEntity multipart = builder.build();
//                ocrRequestOne.setEntity(multipart);
                } catch (Exception ex) {
                    ex.printStackTrace();
                    System.exit(1);
                }
            }

            CloseableHttpClient client = HttpClientBuilder.create().build();

            RequestConfig config = null;
            if (withProxy) {
                HttpHost proxy = new HttpHost("www-proxy.us.oracle.com", 80);
                config = RequestConfig.custom().setProxy(proxy).build();
                ocrRequestOne.setConfig(config);
            }

            HttpResponse response = client.execute(ocrRequestOne);
            String responseAsString = EntityUtils.toString(response.getEntity());
            System.out.printf(">> Response status code: %d%n", response.getStatusLine().getStatusCode());
            System.out.println(responseAsString);
            // Check the other URL in the response's headers
            Header[] headers = response.getHeaders(OPERATION_LOCATION);
            String nextUrl;
            if (headers != null && headers.length == 1) {
                nextUrl = headers[0].getValue();
                if (nextUrl != null) {
                    log.info(String.format("Send URL: %s", nextUrl));
                    HttpGet ocrRequestTwo = new HttpGet(nextUrl);
                    ocrRequestTwo.setHeader(HttpHeaders.ACCEPT, "*/*");
                    ocrRequestTwo.setHeader(SUBSCRIPTION_KEY_HEADER, msKey.trim());
                    if (withProxy) {
                        ocrRequestTwo.setConfig(config); // For the proxy
                    }

                    log.info(String.format("Second Request: %s", ocrRequestTwo.toString()));

                    boolean completed = false;
                    int nbLoops = 0;
                    String processStatus = "";
                    while (!completed && nbLoops < MAX_RETRIEVE_LOOPS) {
                        HttpResponse secondResponse = client.execute(ocrRequestTwo);
                        System.out.printf(">> Second response status code: %d%n", secondResponse.getStatusLine().getStatusCode());
                        String retrieved = EntityUtils.toString(secondResponse.getEntity());
                        try {
                            var readValue = new ObjectMapper().readValue(retrieved, Map.class); // Java 11 ;)
                            processStatus = (String) readValue.get("status");
                            if ("succeeded".equals(processStatus)) {
                                finalResponse = retrieved;

                                log.info(String.format("Final response: %s", retrieved));

                                completed = true;
                            } else {
                                nbLoops++;
                                log.info(String.format("Waiting for status 'succeeded', now '%s'", processStatus));
                                try {
                                    Thread.sleep(1_000);
                                } catch (InterruptedException ie) {
                                    ie.printStackTrace();
                                }
                            }
                        } catch (JsonProcessingException jpe) {
                            jpe.printStackTrace();
                        }
                    }
                    if (!completed) { // Then come back later to get your result.
                        // Provide secondEndpoint in payload, for subsequent access.
                        String message =
                                String.format(
                                        "Request at %s still in state '%s' after %d tries. Come back later.",
                                        nextUrl, processStatus, MAX_RETRIEVE_LOOPS);
                        throw new RuntimeException(message);
                    }
                }
            } else {
                // Really? Honk!
                throw new RuntimeException("Operation-Location was not found in the first response...");
            }
        } catch (IOException e) {
            e.printStackTrace();
            finalResponse = e.getMessage();
        }
        return finalResponse;
    }

    /**
     * Quick and dirty..., not for prod.
     * @param json The object
     * @param path The path
     * @return the value the path points on.
     */
    private static Object findInJson(Object json, String path) {
        Object result = null;
        String[] pathElements = path.split("/");
        for (String element : pathElements) {
//            System.out.println("Processing JSON path for " + element);
            if (element.equals("#")) { // the root
                result = json;
            } else {
                if (result != null) {
//                    System.out.println(String.format(">> %s", result.getClass().getName()));
                    if (result instanceof Map) {
                        result = ((Map<String, Object>) result).get(element);
                    } else if (result instanceof List) {
                        result = ((List<Object>)result).get(Integer.parseInt(element));
                    }
                } else {
                    System.out.printf("Found null for element %s%n", element);
                    return null;
                }
            }
        }
        return result;
    }

    private final static String imageURL = "https://upload.wikimedia.org/wikipedia/commons/0/0b/ReceiptSwiss.jpg";
    private final static String imagePath = "../OpenCV-doc-processing/FormProcessingSampleData/gas.receipt.jpg";

    private final static String PROXY_PRM_PREFIX = "--use-proxy:";
    private final static String DETAIL_PRM_PREFIX = "--text-details:";
    private final static String VERBOSE_PRM_PREFIX = "--verbose:";

    /**
     * Will send documents for OCR processing.
     *
     * @param args can be
     *             --use-proxy:true|false. Default is false.
     *             --text-details:true|false. Default is false.
     *             --verbose:true|false. Default is false.
     */
    public static void main(String... args) {

        boolean verbose = false;

        ProcessContent[] images = new ProcessContent[] {
                new ProcessContent(ProcessContent.ContentType.IMAGE_URL, imageURL),
                new ProcessContent(ProcessContent.ContentType.IMAGE_PATH, imagePath)
        };
        boolean useProxy = false;
        boolean withTextDetails = true;
        if (args.length > 0) {
            for (String arg : args) {
                if (arg.startsWith(PROXY_PRM_PREFIX)) {
                    useProxy = arg.substring(PROXY_PRM_PREFIX.length()).equals("true");
                }
                if (arg.startsWith(DETAIL_PRM_PREFIX)) {
                    withTextDetails = arg.substring(DETAIL_PRM_PREFIX.length()).equals("true");
                }
                if (arg.startsWith(VERBOSE_PRM_PREFIX)) {
                    verbose = arg.substring(VERBOSE_PRM_PREFIX.length()).equals("true");
                }
            }
        }

        for (ProcessContent processContent : images) {
            String parsedContent = reachOutToMsOcrService(processContent, useProxy, withTextDetails);
            try {
                ObjectMapper mapper = new ObjectMapper();
                Object json = mapper.readValue(parsedContent, Object.class);
                String indented = mapper
                        .writerWithDefaultPrettyPrinter()
                        .writeValueAsString(json);
                // Write the result on the file system
                String outputFileName;
                if (processContent.getContentType().equals(ProcessContent.ContentType.IMAGE_PATH)) {
                    outputFileName = processContent.getLocation().substring(processContent.getLocation().lastIndexOf(File.separator) + 1);
                } else {
                    outputFileName = processContent.getLocation().substring(processContent.getLocation().lastIndexOf("/") + 1);
                }
                outputFileName += ".json";
                File outputFile = new File(outputFileName);
                BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile));
                bw.write(indented);
                bw.close();
                System.out.printf("-- Data written to %s%n", outputFile.getAbsolutePath());
                if (verbose) {
                    System.out.println(indented);
                }
                // For fun: Parse final output, extract field values.
                // Look for "#/analyzeResult/documentResults/0/fields/VendorAddress/text
                // Look for "#/analyzeResult/documentResults/0/fields/InvoiceTotal/text, valueNumber
                String pathOne = "#/analyzeResult/documentResults/0/fields/VendorAddress/text";
                Object vendorAddress = findInJson(json, pathOne);
                if (vendorAddress != null) {
                    System.out.printf("VendorAddress, %s, %s%n", vendorAddress.getClass().getName(), vendorAddress.toString());
                }
                String pathTwo = "#/analyzeResult/documentResults/0/fields/InvoiceTotal/text";
                Object invoiceTotalStr = findInJson(json, pathTwo);
                if (invoiceTotalStr != null) {
                    System.out.printf("InvoiceTotal (str), %s, %s%n", invoiceTotalStr.getClass().getName(), invoiceTotalStr.toString());
                }
                String pathThree = "#/analyzeResult/documentResults/0/fields/InvoiceTotal/valueNumber";
                Object invoiceTotalVal = findInJson(json, pathThree);
                if (invoiceTotalVal != null) {
                    System.out.printf("InvoiceTotal (val), %s, %s%n", invoiceTotalVal.getClass().getName(), invoiceTotalVal.toString());
                }
            } catch (Exception ex) {
                if (verbose) {
                    System.out.println(parsedContent);
                }
                ex.printStackTrace();
            }
        }
    }
}
