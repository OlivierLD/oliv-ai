module oliv.ai.opencv.main {
	requires javafx.fxml;
	requires javafx.controls;
	requires javafx.swing;

	exports java.util.logging;
	exports org.opencv.core;
	exports org.opencv.imgcodecs;
	exports org.opencv.imgproc;
	exports org.opencv.videoio;

	opens oliv.opencv;
	opens it.polito.elite.teaching.cv.dummy;
}
