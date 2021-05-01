package docai.opencv;

import cv.utils.Utils;
import docai.opencv.swing.SwingFrame;
import org.opencv.core.Core;
import org.opencv.core.Mat;

import java.awt.*;

/**
 * Oliv did it.
 * Basic OpenCV image manipulations.
 * Display images in Swing
 * Read image from the Web (from a URL)
 *
 * Uses assertions.
 */
public class OpenCVSwingReadURL {

	private final static String IMAGE_URL = "http://donpedro.lediouris.net/journal/trip/PB180629.JPG";
	private final static int DEFAULT_FRAME_WIDTH =  1_024;
	private final static int DEFAULT_FRAME_HEIGHT =   760;

//	private final static long WAIT = 5_000L;

	private static SwingFrame swingFrame = null;

	public static void process(String imageUrl) {

		swingFrame = new SwingFrame();
		swingFrame.setTitle("OpenCV read image from URL");

		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		System.out.println(String.format("Screen Dimensions: w %d h %d", screenSize.width, screenSize.height));

		Dimension frameSize = new Dimension(Math.min(DEFAULT_FRAME_WIDTH, screenSize.width),
											Math.min(DEFAULT_FRAME_HEIGHT, screenSize.height));
		swingFrame.setSize(frameSize);
		int x = (int) ((screenSize.getWidth() - swingFrame.getWidth()) / 2);
		int y = (int) ((screenSize.getHeight() - swingFrame.getHeight()) / 2);
		swingFrame.setLocation(x, y);
		swingFrame.setVisible(true);

		int padding = 30;

		try {
			Mat image = Utils.readMatFromURL(imageUrl);
//			swingFrame.setSize(new Dimension(image.width(), image.height() + padding));
//			swingFrame.setPreferredSize(new Dimension(image.width(), image.height() + padding));

			System.out.println(String.format("Original image: w %d, h %d, channels %d", image.width(), image.height(), image.channels()));

			System.out.println("-> Original");
			swingFrame.plot(Utils.mat2AWTImage(image), "Original - from its URL on the Web");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
//		System.out.println("Done!");
	}

	public static void main(String... args) {
		// load the OpenCV native library
		System.out.println("Loading " + Core.NATIVE_LIBRARY_NAME);
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

		process(IMAGE_URL);

		System.out.println("Keep watching, Bye!");
	}
}
