package oliv;

/*
 * See https://azure.microsoft.com/en-au/services/cognitive-services/form-recognizer/#overview
 *
 * Also see the code samples at https://westus2.dev.cognitive.microsoft.com/docs/services/form-recognizer-api-v2-preview/operations/AnalyzeLayoutAsync
 * Bottom of the page.
 */
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.*;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
//import org.apache.http.entity.mime.MultipartEntityBuilder;


import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MSFormRecognizer {

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

    private static String findExtension(String fullPath) {
        return fullPath.substring(fullPath.lastIndexOf(".") + 1);
    }

    private static String reachOutToMsOcrService(ProcessContent processContent, boolean withProxy) {

        String finalResponse = "{}";

        String msBaseUrl = DEFAULT_MS_BASE_URL;
        String msKey = DEFAULT_MS_OCR_KEY;

        /*
         * See this: https://blogs.oracle.com/oit-ces/oci-rest-api-made-simple-get-request-in-java
         *           https://www.baeldung.com/httpclient-post-http-request
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
                    boolean completed = false;
                    int nbLoops = 0;
                    String processStatus = "";
                    while (!completed && nbLoops < MAX_RETRIEVE_LOOPS) {
                        HttpResponse secondResponse = client.execute(ocrRequestTwo);
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
                        finalResponse =
                                String.format(
                                        "{ \"end-point\": \"%s\", \"message\": \"%s\" }",
                                        nextUrl, message);
                    }
                }
            } else {
                // Really?
                // TODO Honk
                finalResponse = "Operation-Location was not found...";
            }
        } catch (IOException e) {
            e.printStackTrace();
            finalResponse = e.getMessage();
        }
        return finalResponse;
    }

    private final static String imageURL = "https://upload.wikimedia.org/wikipedia/commons/0/0b/ReceiptSwiss.jpg";
    private final static String imagePath = "/Users/olivierlediouris/repos/oliv-ai/OpenCV-doc-processing/FormProcessingSampleData/gas.receipt.jpg";

    private final static String PROXY_PRM_PREFIX = "--use-proxy:";

    public static void main(String... args) {
        ProcessContent[] images = new ProcessContent[]{
                new ProcessContent(ProcessContent.ContentType.IMAGE_URL, imageURL),
                new ProcessContent(ProcessContent.ContentType.IMAGE_PATH, imagePath)
        };
        boolean useProxy = false;
        if (args.length > 0) {
            for (String arg : args) {
                if (arg.startsWith(PROXY_PRM_PREFIX)) {
                    useProxy = arg.substring(PROXY_PRM_PREFIX.length()).equals("true");
                }
            }
        }

        for (ProcessContent processContent : images) {
            String parsedContent = reachOutToMsOcrService(processContent, useProxy);
            try {
                ObjectMapper mapper = new ObjectMapper();
                Object json = mapper.readValue(parsedContent, Object.class);
                String indented = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(json);
                System.out.println(indented);
            } catch (Exception ex) {
                System.out.println(parsedContent);
                ex.printStackTrace();
            }
        }
    }
}
