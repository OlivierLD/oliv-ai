package docai.opencv;

import net.sourceforge.tess4j.Tesseract;

import java.io.File;

/**
 * Need the java.library.path to be set to find libtesseract.xxx (libtesseract.dylib on Mac)
 * On Mac: -Djava.library.path=/usr/local/lib/
 *
 * Could not get it to work...
 */
public class Tess4J101 {

    public static void main(String... args) throws Exception {
        System.out.println(String.format("JAVA_LIB_PATH:%s", System.getProperty("java.library.path")));
        System.out.println(String.format("Running from %s", System.getProperty("user.dir")));

        File imageFile = new File("./FormProcessingSampleData/gas.receipt.jpg");
        if (!imageFile.exists()) {
            System.out.println("Image to process not found, exiting.");
            System.exit(1);
        }
        Tesseract tesseract = new Tesseract();
        tesseract.setDatapath(".");
        tesseract.setLanguage("eng");
        tesseract.setPageSegMode(1);
        tesseract.setOcrEngineMode(1);
        String result = tesseract.doOCR(imageFile);

        System.out.println(result);
    }
}
