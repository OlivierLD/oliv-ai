import org.tensorflow.Graph;
import org.tensorflow.Session;
import org.tensorflow.Tensor;
import org.tensorflow.TensorFlow;

import java.nio.charset.StandardCharsets;

public class HelloTF {
	public static void main(String... args) throws Exception {
		try (Graph graph = new Graph()) {
			final String value = "Hello from TF " + TensorFlow.version();

			// Construct the computation graph with a single operation, a constant
			// named "MyConst" with a value "value".
			try (Tensor t = Tensor.create(value.getBytes(StandardCharsets.UTF_8))) {
				// The Java API doesn't yet include convenience functions for adding operations.
				graph.opBuilder("Const", "MyConst")
						.setAttr("dtype", t.dataType())
						.setAttr("value", t)
						.build();
			}

			// Execute the "MyConst" operation in a Session.
			try (Session session = new Session(graph);
			     Tensor output = session.runner()
					     .fetch("MyConst")
					     .run()
					     .get(0)) { // Auto-closable
				System.out.println("--- In Session ---");
				System.out.println(new String(output.bytesValue(), StandardCharsets.UTF_8));
				System.out.println("-------------------");
			}
		}
		System.out.println("Done.");
	}
}
