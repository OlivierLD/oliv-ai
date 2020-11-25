package digit.prediction;

import io.micronaut.context.annotation.ConfigurationProperties;

@ConfigurationProperties("python-config")
public class PredictConfig {

    private String pythonFolder;
    private String kerasModel;

    public PredictConfig() {

    }

    public String getPythonFolder() {
        return pythonFolder;
    }

    public void setPythonFolder(String pythonFolder) {
        this.pythonFolder = pythonFolder;
    }

    public String getKerasModel() {
        return kerasModel;
    }

    public void setKerasModel(String kerasModel) {
        this.kerasModel = kerasModel;
    }

}
