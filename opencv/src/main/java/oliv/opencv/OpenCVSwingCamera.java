package oliv.opencv;

import cv.utils.Utils;
import oliv.opencv.swing.SwingFrameWithWidgets;
import org.opencv.core.Core;
import org.opencv.core.CvException;
import org.opencv.core.CvType;
import org.opencv.core.Mat;
import org.opencv.core.MatOfPoint;
import org.opencv.core.Scalar;
import org.opencv.core.Size;
import org.opencv.imgproc.Imgproc;
import org.opencv.videoio.VideoCapture;
import org.opencv.videoio.Videoio;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * Oliv did it.
 * Basic OpenCV image manipulations on frames returned by the Camera
 * Display images in a Swing JPanel, with widgets to interact with some OpenCV options
 */
public class OpenCVSwingCamera {

	private ScheduledExecutorService timer;
	private VideoCapture camera = null;
	private boolean cameraActive = false;
	private final static int cameraId = 0;

	private static SwingFrameWithWidgets swingFrame = null;

	private final static int DEFAULT_FRAME_WIDTH =  800;
	private final static int DEFAULT_FRAME_HEIGHT = 760;
	private final static int DEFAULT_IMAGE_WIDTH =  800;
	private final static int DEFAULT_IMAGE_HEIGHT = 600;

	public OpenCVSwingCamera() {
		swingFrame = new SwingFrameWithWidgets(DEFAULT_FRAME_WIDTH, DEFAULT_FRAME_HEIGHT, DEFAULT_IMAGE_WIDTH, DEFAULT_IMAGE_HEIGHT);
		Dimension dimension = Toolkit.getDefaultToolkit().getScreenSize();
		int x = (int) ((dimension.getWidth() - swingFrame.getWidth()) / 2);
		int y = (int) ((dimension.getHeight() - swingFrame.getHeight()) / 2);
		swingFrame.setLocation(x, y);
		swingFrame.setVisible(true);

		swingFrame.addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent evt) {
				stopAcquisition();
				System.out.println("Closing!");
				System.exit(0);
			}
		});
		startCamera();
	}

	private final static double VIDEO_WIDTH = DEFAULT_IMAGE_WIDTH;
	private final static double VIDEO_HEIGHT = DEFAULT_IMAGE_HEIGHT;

	protected void startCamera() {
		this.camera = new VideoCapture(); // cameraId, Videoio.CAP_ANY); // With a cameraId: also opens the camera
		System.out.println(String.format("Camera opened: %s", this.camera.isOpened()));

		if (!this.cameraActive) {

			this.camera.open(cameraId);

			// Not able to set the frame size on the internal camera of the Mac (USB WebCam OK)... Works from Python though.
			boolean wSet = this.camera.set(Videoio.CAP_PROP_FRAME_WIDTH, VIDEO_WIDTH);
			boolean hSet = this.camera.set(Videoio.CAP_PROP_FRAME_HEIGHT, VIDEO_HEIGHT);
			System.out.println(String.format("Setting video frame size to %.02f x %.02f => W set: %s, H set: %s", VIDEO_WIDTH, VIDEO_HEIGHT, wSet, hSet));
			System.out.println(String.format(">> Capture size WxH: %.02f x %.02f", this.camera.get(Videoio.CAP_PROP_FRAME_WIDTH), this.camera.get(Videoio.CAP_PROP_FRAME_HEIGHT)));

			if (this.camera.isOpened()) {
				this.cameraActive = true;
				// grab a frame every 33 ms (30 frames/sec)
				Runnable frameGrabber = () -> process(grabFrame());

				this.timer = Executors.newSingleThreadScheduledExecutor();
				this.timer.scheduleAtFixedRate(frameGrabber, 0, 33, TimeUnit.MILLISECONDS);
			} else {
				System.err.println("Impossible to open the camera connection...");
			}
		} else {
			this.cameraActive = false;
			this.stopAcquisition();
		}
	}

	/**
	 * Get a frame from the opened video stream (if any)
	 *
	 * @return the {@link Mat} to show
	 */
	private Mat grabFrame() {
		Mat frame = new Mat();
		if (this.camera.isOpened()) {
			try {
				this.camera.read(frame);
			} catch (Exception e) {
				System.err.println("Exception during camera capture: " + e);
			}
		}
//		System.out.println(String.format("Read image from camera %d x %d", frame.width(), frame.height()));
		return frame;
	}

	/**
	 * Stop the acquisition from the camera and release all the resources
	 */
	private void stopAcquisition() {
		if (this.timer != null && !this.timer.isShutdown()) {
			try {
				// stop the timer
				this.timer.shutdown();
				this.timer.awaitTermination(33, TimeUnit.MILLISECONDS);
			} catch (InterruptedException e) {
				System.err.println("Exception when stopping the frame camera, will try to release the camera now... " + e);
			}
		}

		if (this.camera.isOpened()) {
			this.camera.release();
		}
	}

	private static byte saturate(double val) {
		int iVal = (int) Math.round(val);
		iVal = Math.min(255, Math.max(iVal, 0));
		return (byte) iVal;
	}

	public static void process(Mat frame) {

		Mat original; // For the contours, if needed.

		// Zoom slider
		double zoomFactor = swingFrame.getZoomValue();
		if (zoomFactor != 1) {
			original = new Mat();
			Imgproc.resize(frame, original, new Size(Math.round(frame.width() * zoomFactor), Math.round(frame.height() * zoomFactor)));
		} else {
			original = frame.clone();
		}

		Mat newMat;
		if (swingFrame.isDivideChecked()) {
			newMat = new Mat();
			Imgproc.resize(original, newMat, new Size(Math.round(original.width() / 2), Math.round(original.height() / 2)));
			original = newMat;
		}
		Mat lastMat = original;

		// Brightness & Contrast
		if (swingFrame.isContrastBrightnessChecked()) {
			newMat = Mat.zeros(lastMat.size(), lastMat.type());
			double alpha = swingFrame.getContrastValue();  // Simple contrast control [1.0, 3.0]
			int beta = swingFrame.getBrightnessValue();    // Simple brightness control [0, 100]
			byte[] imageData = new byte[(int) (lastMat.total() * lastMat.channels())];
			lastMat.get(0, 0, imageData);
			byte[] newImageData = new byte[(int) (newMat.total() * newMat.channels())];
			for (int y = 0; y < lastMat.rows(); y++) {
				for (int x = 0; x < lastMat.cols(); x++) {
					for (int c = 0; c < lastMat.channels(); c++) {
						double pixelValue = imageData[(y * lastMat.cols() + x) * lastMat.channels() + c];
						pixelValue = pixelValue < 0 ? pixelValue + 256 : pixelValue;
						newImageData[(y * lastMat.cols() + x) * lastMat.channels() + c] = saturate(alpha * pixelValue + beta);
					}
				}
			}
			newMat.put(0, 0, newImageData);
			lastMat = newMat;
		}

		// All required Tx (checkboxes in the UI)
		if (swingFrame.isGrayChecked()) {
			newMat = new Mat();
			Imgproc.cvtColor(lastMat, newMat, Imgproc.COLOR_BGR2GRAY);
			lastMat = newMat;
		}
		if (swingFrame.isBlurChecked()) {
			newMat = new Mat();
			double sigmaX = 0d;
			int gkSize = swingFrame.getGaussianKernelSize(); // From the slider
			final Size kSize = new Size(gkSize, gkSize);
			Imgproc.GaussianBlur(lastMat, newMat, kSize, sigmaX);
			lastMat = newMat;
		}
		if (swingFrame.isThreshedChecked()) {
			newMat = new Mat();
			Imgproc.threshold(lastMat, newMat, 127, 255, 0);
			lastMat = newMat;
		}
		if (swingFrame.isCannyChecked()) {
			newMat = new Mat();
			Imgproc.Canny(lastMat, newMat, 10, 100);
			lastMat = newMat;
		}
		if (swingFrame.isContoursChecked()) {
			if (swingFrame.isContoursOnNewImageChecked()) {
				newMat = new Mat(original.height(), original.width(), CvType.CV_8UC1); // Write on a new image
			} else {
				newMat = original.clone(); // Write on ORIGINAL image
			}
			try {
				List<MatOfPoint> contours = new ArrayList<>();
				Imgproc.findContours(lastMat, contours, new Mat(), Imgproc.RETR_TREE, Imgproc.CHAIN_APPROX_SIMPLE);
				Scalar contourColor = swingFrame.isContoursOnNewImageChecked() ? new Scalar(255, 255, 255) : new Scalar(0, 255, 0);
				Imgproc.drawContours(newMat, contours, -1, contourColor, 2);
				lastMat = newMat;
			} catch (CvException cve) {
				cve.printStackTrace();
			}
		}
		if (swingFrame.isInvertChecked()) {
			newMat = new Mat();
			Core.bitwise_not(lastMat, newMat);
			lastMat = newMat;
		}

		swingFrame.plot(Utils.mat2AWTImage(lastMat), String.format("Java %s, Swing and OpenCV %s", System.getProperty("java.version"), Core.getVersionString()));
	}

	public static void main(String... args) {
		// load the OpenCV native library
		System.out.println("Loading lib " + Core.NATIVE_LIBRARY_NAME);
		System.loadLibrary(Core.NATIVE_LIBRARY_NAME);

		new OpenCVSwingCamera();

		System.out.println("On its way!");
	}
}
