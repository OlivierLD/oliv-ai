package digit.prediction;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Note: JSR-223 has been deprecated.
 * So we're using ProcessBuilder
 */
public class PythonInvoker {

    public static List<String> invokePython(String script, String... args) throws Exception {
        List<String> result = new ArrayList<>();
        List<String> allArgs = new ArrayList<>();
        allArgs.add("python3");
        allArgs.add(script);
        if (args != null && args.length > 0) {
            Arrays.asList(args).forEach(arg -> {
                System.out.println("Adding parameter: " + arg);
                try {
                    allArgs.add(arg);
                } catch (Exception ex) {
                    System.err.println(ex.getMessage());
                }
            });
        }
        ProcessBuilder processBuilder = new ProcessBuilder(allArgs);
        processBuilder.redirectErrorStream(true);
        Process process = processBuilder.start();
        InputStream outputStream = process.getInputStream();
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(outputStream, StandardCharsets.UTF_8));
        String line;
        try {
            while ((line = bufferedReader.readLine()) != null) {
                result.add(line);
            }
        } catch (IOException ioe) {
            throw ioe;
        }
        return result;
    }

    /**
     * This is just for tests.
     * @param args
     */
    public static void main(String... args) {
        System.out.println(String.format("Running from %s", System.getProperty("user.dir")));
        try {
            List<String> pythonOutput = invokePython("JupyterNotebooks/deep.learning.crash.course/Micronaut/mn/python/versions.py");
            pythonOutput.forEach(System.out::println);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
