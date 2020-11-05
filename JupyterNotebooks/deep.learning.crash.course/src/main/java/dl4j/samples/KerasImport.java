package dl4j.samples;

import org.deeplearning4j.nn.modelimport.keras.KerasModelImport;
import org.deeplearning4j.nn.multilayer.MultiLayerNetwork;
import org.nd4j.linalg.api.ndarray.INDArray;
import org.nd4j.linalg.factory.Nd4j;
import org.nd4j.linalg.io.ClassPathResource;

import java.io.File;
import java.io.FileNotFoundException;

/**
 * Taken from https://deeplearning4j.org/docs/latest/keras-import-overview
 * Some stuff to look at too at https://github.com/deeplearning4j/dl4j-examples/tree/master/dl4j-examples/src/main/java/org/deeplearning4j/examples
 *
 */
public class KerasImport {
	public static void main(String... args) throws Exception {
//		String simpleMlp = new ClassPathResource("insurance.h5").getFile().getPath();
//		String simpleMlp = "insurance.demo/insurance.h5";
//		String simpleMlp = "digit.demo/training.h5";
		String simpleMlp = "digit.demo/convnet/convnet.h5";
		// Exists?
		if (true) {
			if (!(new File(simpleMlp).exists())) {
				throw new FileNotFoundException(String.format("%s not found in %s", simpleMlp, System.getProperty("user.dir")));
			} else {
				System.out.println(String.format("%s was found in %s", simpleMlp, System.getProperty("user.dir")));
			}
		}
		MultiLayerNetwork model = KerasModelImport.importKerasSequentialModelAndWeights(simpleMlp);

//		const example = tf.tensor([[100, 47, 10]]); // The tensor
//		const prediction = model.predict(example);
//
//		const value = await prediction.data();

		INDArray input = Nd4j.create(new int[] {100, 47, 10});
		int[] prediction = model.predict(input);
	}
}
