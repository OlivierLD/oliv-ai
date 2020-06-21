package oliv.opencv.swing;

import javax.swing.BorderFactory;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSlider;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Image;
import java.awt.Insets;
import java.awt.Toolkit;
import java.awt.event.ComponentEvent;
import java.awt.event.ComponentListener;

/**
 * A Canvas & Frame, in Swing.
 */
public class SwingFrameWithWidgets extends JFrame implements ComponentListener {

	private SwingImagePanel swingImagePanel;

	private JCheckBox divideCheckBox = null;
	private JCheckBox contrastBrightnessCheckBox = null;
	private final static String B_AND_C_LABEL = "Contrasts & Brightness";
	private JLabel cbLabel = null;
	private JCheckBox grayCheckBox = null;
	private JCheckBox blurCheckBox = null;
	private final static String BLUR_LABEL = "To Gaussian Blur";
	private JCheckBox invertCheckBox = null;
	private final static String INVERT_LABEL = "Invert Colors";
	private JCheckBox threshedCheckBox = null;
	private JCheckBox cannyCheckBox = null;
	private JCheckBox contoursCheckBox = null;
	private JCheckBox contoursOnNewImageCheckBox = null;

	private JSlider zoomSlider = null;
	private JSlider gaussSlider = null;
	private JSlider contrastSlider = null;
	private JSlider brightnessSlider = null;

	private JLabel zoomLabel = null;

	private final static int DEFAULT_WIDTH = 600;
	private final static int DEFAULT_HEIGHT = 400;

	private final static double MAX_ZOOM_FACTOR = 5d;
	private final static int MAX_ZOOM_SLIDER_VALUE = 100;

	private static double sliderToZoom(int sliderValue) {
		double zoom = 1d;
		if (sliderValue != 0) {
		  if (sliderValue > 0) {
		  	zoom = 1 + (MAX_ZOOM_FACTOR * ((double)sliderValue / (double)MAX_ZOOM_SLIDER_VALUE));
		  } else {
			  zoom = (1d / MAX_ZOOM_FACTOR) + (((((double)MAX_ZOOM_SLIDER_VALUE + (double)sliderValue) / (double)MAX_ZOOM_SLIDER_VALUE) * (MAX_ZOOM_FACTOR - 1)) / MAX_ZOOM_FACTOR);
		  }
		}
		return zoom;
	}

	@Override
	public void componentResized(ComponentEvent e) {
		System.out.println(String.format("Frame size is now %d x %d", this.getWidth(), this.getHeight()));
	}

	@Override
	public void componentMoved(ComponentEvent e) {
	}

	@Override
	public void componentShown(ComponentEvent e) {
	}

	@Override
	public void componentHidden(ComponentEvent e) {
	}

	public SwingFrameWithWidgets() {
		this(DEFAULT_WIDTH, DEFAULT_HEIGHT);
	}

	public SwingFrameWithWidgets(int origW, int origH) {
		this(origW, origH, DEFAULT_WIDTH, DEFAULT_HEIGHT);
	}

	public SwingFrameWithWidgets(int origW, int origH, int imageWidth, int imageHeight) {
		initComponents(imageWidth, imageHeight);
		this.setSize(new Dimension(origW, origH));
		this.setPreferredSize(new Dimension(origW, origH));
		this.setTitle("OpenCV");

		this.getContentPane().addComponentListener(this);

		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		Dimension frameSize = this.getSize();
		if (frameSize.height > screenSize.height) {
			frameSize.height = screenSize.height;
		}
		if (frameSize.width > screenSize.width) {
			frameSize.width = screenSize.width;
		}
		this.setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
		this.setVisible(true);
	}

	/**
	 * This method is called from within the constructor to
	 * initialize the form.
	 */
	private void initComponents(int imageWidth, int imageHeight) {
		swingImagePanel = new SwingImagePanel(imageWidth, imageHeight);

		this.getContentPane().setLayout(new BorderLayout());

		JScrollPane scrollPane = new JScrollPane(swingImagePanel, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
		scrollPane.addComponentListener(new ComponentListener() {
			@Override
			public void componentResized(ComponentEvent e) {
				System.out.println(String.format("\tScrollPane size is now %d x %d", scrollPane.getWidth(), scrollPane.getHeight()));
			}

			@Override
			public void componentMoved(ComponentEvent e) {
			}

			@Override
			public void componentShown(ComponentEvent e) {
			}

			@Override
			public void componentHidden(ComponentEvent e) {
			}
		});
		this.getContentPane().add(scrollPane, BorderLayout.CENTER);

		JPanel bottomPanel = new JPanel();
		bottomPanel.setLayout(new GridBagLayout());
		bottomPanel.setBorder(BorderFactory.createTitledBorder("Transformations"));

		divideCheckBox = new JCheckBox("Divide by 2");
		divideCheckBox.setSelected(false);

		zoomLabel = new JLabel("Zoom: 1.00");

		zoomSlider = new JSlider(JSlider.HORIZONTAL, -MAX_ZOOM_SLIDER_VALUE, MAX_ZOOM_SLIDER_VALUE, 0);
		zoomSlider.setEnabled(true);
		zoomSlider.addChangeListener(changeEvent -> {
			int zoomSliderValue = zoomSlider.getValue();
			System.out.println(String.format("Zoom: %d => %.02f", zoomSliderValue, sliderToZoom(zoomSliderValue)));
			zoomLabel.setText(String.format("Zoom: %.02f", sliderToZoom(zoomSliderValue)));
		});
		zoomSlider.setToolTipText("Zoom factor");

		JPanel twoCBPanel = new JPanel();
		twoCBPanel.setLayout(new GridBagLayout());

		grayCheckBox = new JCheckBox("To Gray");
		grayCheckBox.setSelected(false);

		blurCheckBox = new JCheckBox(BLUR_LABEL);
		blurCheckBox.setSelected(false);

		invertCheckBox = new JCheckBox(INVERT_LABEL);
		invertCheckBox.setSelected(false);

		threshedCheckBox = new JCheckBox("To Threshed");
		threshedCheckBox.setSelected(false);

		cannyCheckBox = new JCheckBox("To Canny Edges");
		cannyCheckBox.setSelected(false);

		contoursCheckBox = new JCheckBox("With Contours");
		contoursCheckBox.setSelected(false);

		contoursOnNewImageCheckBox = new JCheckBox("Contours on new image");
		contoursOnNewImageCheckBox.setSelected(false);

		contrastBrightnessCheckBox = new JCheckBox(B_AND_C_LABEL);
		contrastBrightnessCheckBox.setSelected(false);

		cbLabel = new JLabel("-");

		gaussSlider = new JSlider(JSlider.HORIZONTAL, 1, 51, 15);
		gaussSlider.setEnabled(true);
		gaussSlider.addChangeListener(changeEvent -> {
			int gaussianKernelSize = getGaussianKernelSize();
			blurCheckBox.setText(String.format("%s (%d)", BLUR_LABEL, gaussianKernelSize));
		});
		gaussSlider.setToolTipText("Gaussian Kernel size");

		contrastSlider = new JSlider(JSlider.HORIZONTAL, 100, 300, 100);
		contrastSlider.setEnabled(true);
		contrastSlider.addChangeListener(changeEvent -> {
			cbLabel.setText(String.format("Cont.:%03d%%, Bright:%.02f", getBrightnessValue(), getContrastValue()));
		});
		contrastSlider.setToolTipText("Contrast");

		brightnessSlider = new JSlider(JSlider.HORIZONTAL, 0, 100, 0);
		brightnessSlider.setEnabled(true);
		brightnessSlider.addChangeListener(changeEvent -> {
			cbLabel.setText(String.format("Cont.:%03d%%, Bright:%.02f", getBrightnessValue(), getContrastValue()));
		});
		brightnessSlider.setToolTipText("Brightness");

		bottomPanel.add(divideCheckBox, new GridBagConstraints(0,
				0,
				1,
				1,
				1.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));

		twoCBPanel.add(grayCheckBox, new GridBagConstraints(0,
				0,
				1,
				1,
				1.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));

		twoCBPanel.add(invertCheckBox, new GridBagConstraints(1,
				0,
				1,
				1,
				1.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));

		bottomPanel.add(twoCBPanel, new GridBagConstraints(1,
				0,
				1,
				1,
				1.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));

//		bottomPanel.add(grayCheckBox, new GridBagConstraints(1,
//				0,
//				1,
//				1,
//				1.0,
//				0.0,
//				GridBagConstraints.WEST,
//				GridBagConstraints.NONE,
//				new Insets(0, 0, 0, 0), 0, 0));
//
//		bottomPanel.add(invertCheckBox, new GridBagConstraints(2,
//				0,
//				1,
//				1,
//				1.0,
//				0.0,
//				GridBagConstraints.WEST,
//				GridBagConstraints.NONE,
//				new Insets(0, 0, 0, 0), 0, 0));


		bottomPanel.add(blurCheckBox, new GridBagConstraints(0,
				1,
				1,
				1,
				1.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));
		bottomPanel.add(gaussSlider, new GridBagConstraints(1,
				1,
				1,
				1,
				5.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.HORIZONTAL,
				new Insets(0, 0, 0, 0), 0, 0));

		bottomPanel.add(threshedCheckBox, new GridBagConstraints(0,
				2,
				2,
				1,
				1.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));
		bottomPanel.add(cannyCheckBox, new GridBagConstraints(1,
				2,
				1,
				1,
				1.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));
		bottomPanel.add(contoursCheckBox, new GridBagConstraints(0,
				3,
				1,
				1,
				1.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));
		bottomPanel.add(contoursOnNewImageCheckBox, new GridBagConstraints(1,
				3,
				1,
				1,
				5.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));

		bottomPanel.add(contrastBrightnessCheckBox, new GridBagConstraints(0,
				4,
				1,
				1,
				1.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));
		bottomPanel.add(contrastSlider, new GridBagConstraints(1,
				4,
				1,
				1,
				5.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.HORIZONTAL,
				new Insets(0, 0, 0, 0), 0, 0));
		bottomPanel.add(cbLabel, new GridBagConstraints(0,
				5,
				1,
				1,
				1.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.NONE,
				new Insets(0, 0, 0, 0), 0, 0));
		bottomPanel.add(brightnessSlider, new GridBagConstraints(1,
				5,
				1,
				1,
				5.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.HORIZONTAL,
				new Insets(0, 0, 0, 0), 0, 0));

		bottomPanel.add(zoomLabel, new GridBagConstraints(0,
				6,
				1,
				1,
				5.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.HORIZONTAL,
				new Insets(0, 0, 0, 0), 0, 0));

		bottomPanel.add(zoomSlider, new GridBagConstraints(1,
				6,
				1,
				1,
				5.0,
				0.0,
				GridBagConstraints.WEST,
				GridBagConstraints.HORIZONTAL,
				new Insets(0, 0, 0, 0), 0, 0));

		this.add(bottomPanel, BorderLayout.SOUTH);

		this.pack();
	}

	public void plot(Image img) {
		plot(img, null);
	}
	public void plot(Image img, String title) {
		if (title != null) {
			this.setTitle(title);
		}
		swingImagePanel.plot(img);
	}

	public boolean isDivideChecked() {
		return this.divideCheckBox.isSelected();
	}
	public boolean isGrayChecked() {
		return this.grayCheckBox.isSelected();
	}
	public boolean isInvertChecked() {
		return this.invertCheckBox.isSelected();
	}
	public boolean isBlurChecked() {
		return this.blurCheckBox.isSelected();
	}
	public boolean isThreshedChecked() {
		return this.threshedCheckBox.isSelected();
	}
	public boolean isCannyChecked() {
		return this.cannyCheckBox.isSelected();
	}
	public boolean isContoursChecked() {
		return this.contoursCheckBox.isSelected();
	}
	public boolean isContrastBrightnessChecked() {
		return this.contrastBrightnessCheckBox.isSelected();
	}
	public boolean isContoursOnNewImageChecked() {
		return this.contoursOnNewImageCheckBox.isSelected();
	}
	public int getGaussianKernelSize() {
		int slider = gaussSlider.getValue();
		if (slider % 2 != 1) { // No even value. Must be odd.
			slider += 1;
		}
		return slider;
	}
	public double getContrastValue() {
		int slider = contrastSlider.getValue();
		return ((double)slider / 100D);
	}
	public int getBrightnessValue() {
		int slider = brightnessSlider.getValue();
		return slider;
	}
	public double getZoomValue() {
		int slider = zoomSlider.getValue();
		return sliderToZoom(slider);
	}

	/**
	 * @param args the command line arguments
	 */
	public static void main(String... args) {
		SwingFrameWithWidgets frame = new SwingFrameWithWidgets();
		frame.setVisible(true);

		frame.plot(null);
	}
}
