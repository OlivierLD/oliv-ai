package tribuo;

import java.nio.file.Paths;

import org.tribuo.Model;
import org.tribuo.MutableDataset;
import org.tribuo.Trainer;
import org.tribuo.evaluation.TrainTestSplitter;
import org.tribuo.data.csv.CSVLoader;
import org.tribuo.classification.*;
import org.tribuo.classification.evaluation.*;
import org.tribuo.classification.sgd.linear.LogisticRegressionTrainer;

import com.fasterxml.jackson.databind.*;
import com.oracle.labs.mlrg.olcut.provenance.ProvenanceUtil;
import com.oracle.labs.mlrg.olcut.config.json.*;

/**
 * From the NoteBook at https://tribuo.org/learn/4.0/tutorials/irises-tribuo-v4.html
 * or also at https://github.com/oracle/tribuo/blob/main/tutorials/irises-tribuo-v4.ipynb
 * Requires Java 10, for its 'var' statements.
 */
public class Classification101 {

    public static void main(String... args) throws Exception {
        // A - Loading the Data
        var labelFactory = new LabelFactory();
        var csvLoader = new CSVLoader<>(labelFactory);

        var irisHeaders = new String[]{"sepalLength", "sepalWidth", "petalLength", "petalWidth", "species"};
        var irisesSource = csvLoader.loadDataSource(Paths.get("bezdekIris.data"), "species", irisHeaders);
        var irisSplitter = new TrainTestSplitter<>(irisesSource, 0.7, 1L);

        var trainingDataset = new MutableDataset<>(irisSplitter.getTrain());
        var testingDataset = new MutableDataset<>(irisSplitter.getTest());
        System.out.println(String.format("Training data size = %d, number of features = %d, number of classes = %d", trainingDataset.size(), trainingDataset.getFeatureMap().size(), trainingDataset.getOutputInfo().size()));
        System.out.println(String.format("Testing data size = %d, number of features = %d, number of classes = %d", testingDataset.size(), testingDataset.getFeatureMap().size(), testingDataset.getOutputInfo().size()));

        // B - Training the model. LogisticRegressionTrainer
        Trainer<Label> trainer = new LogisticRegressionTrainer();
        System.out.println(trainer.toString());

        Model<Label> irisModel = trainer.train(trainingDataset);

        // C - Evaluating the model
        var evaluator = new LabelEvaluator();
        var evaluation = evaluator.evaluate(irisModel, testingDataset);
        System.out.println(evaluation.toString());
        // Confusion Matrix:
        System.out.println(evaluation.getConfusionMatrix().toString());

        // Model Metadata
        var featureMap = irisModel.getFeatureIDMap();
        for (var v : featureMap) {
            System.out.println(v.toString());
            System.out.println();
        }

        // Model Provenance
        var provenance = irisModel.getProvenance();
        System.out.println(ProvenanceUtil.formattedProvenanceString(provenance.getDatasetProvenance().getSourceProvenance()));
        // Find out the training algorithm
        System.out.println(ProvenanceUtil.formattedProvenanceString(provenance.getTrainerProvenance()));

        // Store/print provenance as JSON data
        ObjectMapper objMapper = new ObjectMapper();
        objMapper.registerModule(new JsonProvenanceModule());
        objMapper = objMapper.enable(SerializationFeature.INDENT_OUTPUT);

        String jsonProvenance = objMapper.writeValueAsString(ProvenanceUtil.marshalProvenance(provenance));
        System.out.println(jsonProvenance);
        // Or just toString:
        System.out.println(irisModel.toString());
        /*
         * Evaluations also have a provenance that records the model provenance along with the test data provenance.
         * We're using an alternate form of the JSON provenance that's easier to read, though a little less precise.
         * This form is suitable for reference but can't be used to reconstruct the original provenance object
         * as it's converted everything into Strings.
         */
        String jsonEvaluationProvenance = objMapper.writeValueAsString(ProvenanceUtil.convertToMap(evaluation.getProvenance()));
        System.out.println(jsonEvaluationProvenance);
    }
}
