package docai.opencv;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.core.Size;
import utils.Utils;
import docai.opencv.swing.SwingFrame;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/**
 * Oliv did it.
 * Basic OpenCV image manipulations.
 * Display images in Swing
 *
 * Uses assertions.
 */
public class OpenCVSwing {

//	private final static String IMAGE_SOURCE_PATH = "./oliv-ai/OpenCV-doc-processing/FormProcessingSampleData";
	private final static String IMAGE_SOURCE_PATH = "./FormProcessingSampleData";

	private final static String IMAGE_01 = IMAGE_SOURCE_PATH + File.separator + "gas.receipt.jpg";

	private final static long WAIT = 5_000L; // 10_000L;

	private final static int GRAY_OPTION = 1;
	private final static int BLUR_OPTION = 1 << 1;
	private final static int THRESHOLD_OPTION = 1 << 2;
	private final static int CANNY_OPTION = 1 << 3;

	private static int imageProcessOptions = 0;
	static {
		imageProcessOptions |= GRAY_OPTION;
//		imageProcessOptions |= BLUR_OPTION;
		imageProcessOptions |= THRESHOLD_OPTION;
//		imageProcessOptions |= CANNY_OPTION;
	}

	private static SwingFrame swingFrame = null;

	public final static class FormCell {
		int x;
		int y;
		int w;
		int h;
		String cellName;

		public FormCell() {
		}

		public FormCell(int x, int y, int w, int h) {
			this.x = x;
			this.y = y;
			this.w = w;
			this.h = h;
		}

		public FormCell cellName(String cellName) {
			this.cellName = cellName;
			return this;
		}
	}

	public static void process(String imagePath) {

		swingFrame = new SwingFrame();
		swingFrame.setVisible(true);

		System.out.println(String.format("Will show different states, every %d ms.", WAIT));
		boolean keepLooping = true;
		while (keepLooping) {
			Mat currentImage;
			Mat image = Imgcodecs.imread(imagePath);
			System.out.println(String.format("Original image: w %d, h %d, channels %d", image.width(), image.height(), image.channels()));

			System.out.println("-> Original");
			swingFrame.plot(Utils.mat2AWTImage(image), "Original");
			currentImage = image;

			try {
				Thread.sleep(WAIT);
			} catch (InterruptedException ie) {
				ie.printStackTrace();
			}

			if ((imageProcessOptions & GRAY_OPTION) == GRAY_OPTION) {
				// convert the image in gray scale
				Mat gray = new Mat();
				Imgproc.cvtColor(currentImage, gray, Imgproc.COLOR_BGR2GRAY);

				System.out.println("-> Gray");
				swingFrame.plot(Utils.mat2AWTImage(gray), "Gray");
				currentImage = gray;

				try {
					Thread.sleep(WAIT);
				} catch (InterruptedException ie) {
					ie.printStackTrace();
				}
			}

			if ((imageProcessOptions & BLUR_OPTION) == BLUR_OPTION) {
				// Gaussian blur
				double sigmaX = 0d;
				final Size kSize = new Size(3, 3); // new Size(11, 11); // new Size(31, 31);
				Mat blurred = new Mat();
				Imgproc.GaussianBlur(currentImage, blurred, kSize, sigmaX);

				System.out.println("-> Blurred");
				swingFrame.plot(Utils.mat2AWTImage(blurred), "Blurred");
				currentImage = blurred;

				try {
					Thread.sleep(WAIT);
				} catch (InterruptedException ie) {
					ie.printStackTrace();
				}
			}

			if ((imageProcessOptions & THRESHOLD_OPTION) == THRESHOLD_OPTION) {
				// threshold
				Mat threshed = new Mat();
				Imgproc.threshold(currentImage, threshed, 127, 255, 0);

				System.out.println("-> Threshed");
				swingFrame.plot(Utils.mat2AWTImage(threshed), "Threshed");
				currentImage = threshed;

				try {
					Thread.sleep(WAIT);
				} catch (InterruptedException ie) {
					ie.printStackTrace();
				}
			}

			if ((imageProcessOptions & CANNY_OPTION) == CANNY_OPTION) {
				// Canny edges
				Mat canny = new Mat();
				Imgproc.Canny(image, canny, 10, 100); // From original image
				currentImage = canny;

				System.out.println("-> Canny Edges");
				swingFrame.plot(Utils.mat2AWTImage(canny), "Canny Edges");

				try {
					Thread.sleep(WAIT);
				} catch (InterruptedException ie) {
					ie.printStackTrace();
				}
			}

			List<FormCell> cells = null;
			File annotationFile = new File("annotations.json");
			if (annotationFile.exists()) {
				String line;
				StringBuffer jsonContent = new StringBuffer();
				try {
					BufferedReader br = new BufferedReader(new FileReader(annotationFile));
					boolean keepReading = true;
					while (keepReading) {
						line = br.readLine();
						if (line == null) {
							keepReading = false;
						} else {
							jsonContent.append(line);
						}
					}
					br.close();
					Gson gson = new GsonBuilder().create();
					// Tricky ;)
					Type listOfMyClassObject = new TypeToken<ArrayList<FormCell>>() {}.getType();
					cells = gson.fromJson(jsonContent.toString(), listOfMyClassObject);
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
			} else {
				System.out.println("Annotation file not found");
				cells = new ArrayList<>();
				// Draw cells on the image
				cells.add(new FormCell(230, 360, 155, 30).cellName("Date")); // x, y, w, h
				cells.add(new FormCell(230, 390, 125, 30).cellName("Time"));
				cells.add(new FormCell(400, 770, 140, 40).cellName("Total"));

				// Dump form's cells as JSON
				String content = new Gson().toJson(cells);
				System.out.println(content);
			}

			System.out.println("Now draw cells...");

			System.out.println(String.format("%d tiles", cells.size()));
			Scalar green = new Scalar(0, 255, 0);
//			Scalar red = new Scalar(0, 0, 255);

			for (FormCell cell : cells) {
				int x = cell.x;
				int y = cell.y;
				int w = cell.w;
				int h = cell.h;

				// Crop the cells first, not to see the name and green box
				Rect cropZone = new Rect(x, y, w, h);
				Mat croppedImage = currentImage.submat(cropZone);
				// Write image in file for now
				BufferedImage bufferedImage = Utils.mat2AWTImage(croppedImage);
				try {
					File outputFile = new File(cell.cellName + ".jpg");
					ImageIO.write(bufferedImage, "jpg", outputFile);
				} catch (Exception ex) {
					ex.printStackTrace();
				}

				Point topLeft = new Point(x, y);
				Point topRight = new Point(x + w, y);
				Point bottomLeft = new Point(x, y + h);
				Point bottomRight = new Point(x + w, y + h);
				// draw a box
				Imgproc.line(image, topLeft, topRight, green, 2); // top horizontal line
				Imgproc.line(image, topRight, bottomRight, green, 2); // vertical right
				Imgproc.line(image, bottomRight, bottomLeft, green, 2); // bottom horizontal
				Imgproc.line(image, bottomLeft, topLeft, green, 2); // vertical left
				// The cell name
				Imgproc.putText(image, cell.cellName, new Point(x + 2, y + 12), Imgproc.FONT_HERSHEY_PLAIN, 1.0, new Scalar(255, 0, 0));
			}
			swingFrame.plot(Utils.mat2AWTImage(image), "Form Cells");

			try {
				Thread.sleep(2 * WAIT);
			} catch (InterruptedException ie) {
				ie.printStackTrace();
			}
			keepLooping = false;
		}

//		System.out.println("Done!");
	}

	public static void main(String... args) {
		// load the OpenCV native library
		System.out.println("Loading " + Core.NATIVE_LIBRARY_NAME);
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

		String toProcess = IMAGE_01;
//		String toProcess = IMAGE_02;
		System.out.println(String.format("Loading %s from %s", toProcess, System.getProperty("user.dir")));

		process(toProcess);

		System.out.println("OpenCVSwing, Bye!");
	}
}
