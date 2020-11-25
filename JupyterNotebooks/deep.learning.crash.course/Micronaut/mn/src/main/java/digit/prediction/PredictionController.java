package digit.prediction;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.*;

import javax.annotation.Nullable;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

@Controller("/predict")
public class PredictionController {

    private final PredictConfig predictConfig;

    public PredictionController(@Nullable PredictConfig predictConfig) {
        // For info...
        System.getProperties().forEach((prop, value) -> {
            System.out.println(String.format("Prop %s => %s", prop, value));
        });
        this.predictConfig = predictConfig;

        if (this.predictConfig != null) {
            System.out.println(String.format("Python folder: %s", this.predictConfig.getPythonFolder()));
        } else {
            System.out.println("- No config");
        }
    }

    private String getPythonFolderAbsolutePath() {
        String path = null;
        File pythonFolder = new File(this.predictConfig.getPythonFolder());

        Class<? extends PredictionController> thisClass = this.getClass();
        System.out.println("In " + thisClass.getName());
        URL resource = thisClass.getClassLoader().getResource(".");
        System.out.println("Resource:" + (resource == null ? "null" : resource.getPath()));
        if (resource != null) {
            String resourcePath = resource.getPath();
            if (resourcePath.contains("classes/java")) {
                resourcePath = resourcePath.replace("classes/java", "resources");
            }
            if (false) {
                System.out.println(String.format("Content of %s", resourcePath));
                File resourceDir = new File(resourcePath);
                File[] files = resourceDir.listFiles();
                Arrays.asList(files).forEach(file -> System.out.println(String.format("- %s", file.getAbsolutePath())));
            }
            path = resourcePath + pythonFolder;
        }
        return path;
    }

    private String getPythonScriptPath(String scriptName) {
        return this.getPythonFolderAbsolutePath() + File.separator + scriptName;
    }

    /**
     * --form 'imageContent=@"/<image-path>/Huzzah.jpg"' \
     * --form 'fileName="digit"' \
     * --form 'extension="jpg"'
     *
     * @param imageContent
     * @param fileName
     * @param extension
     * @return
     */
    @Post("/digit")
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.APPLICATION_JSON)
    public List<String> applyModel(byte[] imageContent, String fileName, String extension) {
        String imageToProcess = null;
        try {
            File image = File.createTempFile(fileName, "." + extension);
            Path path = Paths.get(image.getAbsolutePath());
            Files.write(path, imageContent);
            imageToProcess = path.toString();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }

        String kerasModel = this.getPythonFolderAbsolutePath() + File.separator + this.predictConfig.getKerasModel();
        String predictScript = this.getPythonScriptPath("predict.py");

        try {
            List<String> stringList = PythonInvoker.invokePython(predictScript,
                    String.format("--model:%s", kerasModel),
                    String.format("--image:%s", imageToProcess));
            return stringList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Get("/versions")
    @Produces(MediaType.APPLICATION_JSON)
    public List<String> getVersions() {
        // The script is in resources, python/version.py
        String scriptName = this.getPythonScriptPath("versions.py");
        // TODO Check script existence
        try {
            List<String> stringList = PythonInvoker.invokePython(scriptName);
            return stringList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}