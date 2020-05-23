package oliv.opencv;

import cv.utils.Utils;
import oliv.opencv.swing.SwingFrame;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.Size;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;

import java.awt.Dimension;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Oliv did it.
 * Basic OpenCV image manipulations.
 * Display images in Swing
 * Read image from the Web (from a URL)
 *
 * Uses assertions.
 *
 * original -> gray -> threshed
 */
public class OpenCVSwingReadURL {

	private final static String IMAGE_URL = "http://donpedro.lediouris.net/journal/trip/PB180629.JPG";

	private final static long WAIT = 5_000L;

	private static SwingFrame swingFrame = null;

	public static void process(String imageUrl) {

		swingFrame = new SwingFrame();
		swingFrame.setVisible(true);

		int padding = 30;

		try {
			Mat image = Utils.readMatFromURL(imageUrl);
			swingFrame.setSize(new Dimension(image.width(), image.height() + padding));
			swingFrame.setPreferredSize(new Dimension(image.width(), image.height() + padding));

			System.out.println(String.format("Original image: w %d, h %d, channels %d", image.width(), image.height(), image.channels()));

			System.out.println("-> Original");
			swingFrame.plot(Utils.mat2AWTImage(image), "Original");

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

		System.out.println("Bye!");
	}
}
