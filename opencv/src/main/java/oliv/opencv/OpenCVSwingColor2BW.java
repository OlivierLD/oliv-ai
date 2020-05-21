package oliv.opencv;

import cv.utils.Utils;
import oliv.opencv.swing.SwingFrame;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfPoint;
import org.opencv.core.Point;
import org.opencv.core.Scalar;
import org.opencv.core.Size;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;

import java.awt.Dimension;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Oliv did it.
 * Basic OpenCV image manipulations.
 * Display images in Swing
 * Turns a Color picture in Pure B&W,
 * resize it to be displayed on a small SSD1306 128x64 oled screen
 *
 * Uses assertions.
 *
 * original -> gray -> threshed
 */
public class OpenCVSwingColor2BW {

	private final static String IMAGE_SOURCE_PATH = "." + File.separator + "images" + File.separator + "birds";
//	private final static String IMAGE_01 = IMAGE_SOURCE_PATH + File.separator + "cardinal.jpeg";
	private final static String IMAGE_01 = IMAGE_SOURCE_PATH + File.separator + "pelican.01.jpg";

	private final static long WAIT = 1_000L;

	private static SwingFrame swingFrame = null;

	public static void process(String imagePath) {

		swingFrame = new SwingFrame();
		swingFrame.setVisible(true);

		System.out.println(String.format("Will show different states, every %d ms.", WAIT));
		while (true) {
			Mat image = Imgcodecs.imread(imagePath);
			swingFrame.setSize(new Dimension(image.width(), image.height() + 30));
			swingFrame.setPreferredSize(new Dimension(image.width(), image.height() + 30));

			System.out.println(String.format("Original image: w %d, h %d, channels %d", image.width(), image.height(), image.channels()));

			System.out.println("-> Original");
			swingFrame.plot(Utils.mat2AWTImage(image), "Original");

			try {
				Thread.sleep(WAIT);
			} catch (InterruptedException ie) {
				ie.printStackTrace();
			}

			// convert the image in gray scale
			Mat gray = new Mat();
			Imgproc.cvtColor(image, gray, Imgproc.COLOR_BGR2GRAY);

			System.out.println("-> Gray");
			swingFrame.plot(Utils.mat2AWTImage(gray), "Gray");

			try {
				Thread.sleep(WAIT);
			} catch (InterruptedException ie) {
				ie.printStackTrace();
			}

			// threshold
			Mat threshed = new Mat();
			Imgproc.threshold(gray, threshed, 127, 255, 0);

			System.out.println("-> Threshed");
			swingFrame.plot(Utils.mat2AWTImage(threshed), "Threshed");

			try {
				Thread.sleep(WAIT);
			} catch (InterruptedException ie) {
				ie.printStackTrace();
			}

			long[][] screenMatrix = new long[64][2]; // Will contain bits to display on the screen
			// resize
			Mat resized = new Mat();
			// Dim to fit in 128x64
			double sizeFactor = Math.max(threshed.width() / 128d, threshed.height() / 64d);
			Imgproc.resize(threshed, resized, new Size(threshed.width() / sizeFactor, threshed.height() / sizeFactor));
			System.out.println(String.format("Resized to %d x %d", resized.width(), resized.height()));
			swingFrame.plot(Utils.mat2AWTImage(resized), String.format("Resized to %d x %d", resized.width(), resized.height()));

			int topPad = (64 - resized.height()) / 2;
			int bottomPad = topPad;
			int leftPad = (128 - resized.width()) / 2;
			int rightPad = leftPad;

			int hOffset = 0;
			for (int i=0; i<topPad; i++) {
				screenMatrix[hOffset] = new long[] { 0L, 0L };
				hOffset++;
			}
			// pixel by pixel
			for (int h = 0; h<resized.height(); h++) {
				int vOffset = 0;
				long[] matrixLine = new long[] { 0L, 0L };
				for (int i=0; i<leftPad; i++) {
					vOffset++;
				}
				for (int w = 0; w < resized.width(); w++) {
					double[] pix = resized.get(h, w);
//				System.out.println(String.format("Pixel: %d element(s), %f", pix.length, pix[0]));
					assert (pix.length == 1); // threshed is a B&W picture
					if (pix[0] == 0) { // black
						matrixLine[vOffset<64?0:1] |= (1L << (vOffset % 64));
//					} else { // white
					}
//					System.out.println(String.format("h: %d, v: %d => %d %d", hOffset, vOffset, matrixLine[0], matrixLine[1]));
					vOffset++;
				}
				for (int i=0; i<rightPad; i++) {
					vOffset++;
				}
				screenMatrix[hOffset] = matrixLine;
				hOffset++;
			}
			for (int i=0; i<bottomPad; i++) {
				screenMatrix[hOffset] = new long[] { 0L, 0L };
				hOffset++;
			}

			// Store matrix
			try {
				DataOutputStream dat = new DataOutputStream(new FileOutputStream("image.dat"));
				// write dimensions
				dat.writeInt(128); // W
				dat.writeInt(64);  // H
				// Then the data.
				for (int line = 0; line < screenMatrix.length; line++) {
					dat.writeLong(screenMatrix[line][0]);
					dat.writeLong(screenMatrix[line][1]);
				}
				dat.flush();
				dat.close();
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}

			// Display matrix?
			if (false) {
				for (int line = 0; line < screenMatrix.length; line++) {
					System.out.println(String.format("%d %d", screenMatrix[line][0], screenMatrix[line][1]));
				}
			}

			System.out.println("---- From digit matrix ----");
			for (int line=0; line<screenMatrix.length; line++) {
				StringBuffer printLine = new StringBuffer();
				// 2 longs per line
				for (int w=0; w<128; w++) {
					long pixel = ((screenMatrix[line][w<64?0:1] & (1L << (w%64))));
					printLine.append(pixel==0?' ':'\u2588'); // Small: ■, bigger █
				}
				System.out.println(printLine.toString());
			}
			System.out.println("-------------------------------");

			try {
				Thread.sleep(5 * WAIT);
			} catch (InterruptedException ie) {
				ie.printStackTrace();
			}
		}

//		System.out.println("Done!");
	}

	public static void main(String... args) {
		// load the OpenCV native library
		System.out.println("Loading " + Core.NATIVE_LIBRARY_NAME);
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

		process(IMAGE_01);

		System.out.println("Bye!");
	}
}
