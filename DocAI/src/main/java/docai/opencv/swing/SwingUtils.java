package docai.opencv.swing;

import javax.swing.*;
import javax.swing.filechooser.FileFilter;
import java.awt.*;
import java.io.File;
import java.util.Enumeration;
import java.util.Hashtable;

public class SwingUtils {
    public static class ToolFileFilter extends FileFilter {

        public boolean accept(File f) {
            if (f != null) {
                if (f.isDirectory()) {
                    return true;
                }
                String extension = getExtension(f);
                if (filters == null) {
                    return true;
                }
                if (extension != null && filters.get(getExtension(f)) != null) {
                    return true;
                }
            }
            return false;
        }

        public String getExtension(File f) {
            if (f != null) {
                String filename = f.getName();
                int i = filename.lastIndexOf('.');
                if (i > 0 && i < filename.length() - 1) {
                    return filename.substring(i + 1).toLowerCase();
                }
            }
            return null;
        }

        public void addExtension(String extension) {
            if (filters == null) {
                filters = new Hashtable<String, Object>(5);
            }
            filters.put(extension.toLowerCase(), this);
            fullDescription = null;
        }

        public String getDescription() {
            if (fullDescription == null) {
                if (description == null || isExtensionListInDescription()) {
                    if (description != null)
                        fullDescription = description;
                    if (filters != null) {
                        fullDescription += " (";
                        Enumeration extensions = filters.keys();
                        if (extensions != null) {
                            for (fullDescription += "." + (String) extensions.nextElement();
                                 extensions.hasMoreElements();
                                 fullDescription += ", " + (String) extensions.nextElement()) ;
                        }
                        fullDescription += ")";
                    } else
                        fullDescription = "";
                } else {
                    fullDescription = description;
                }
            }
            return fullDescription;
        }

        public void setDescription(String description) {
            this.description = description;
            fullDescription = null;
        }

        public void setExtensionListInDescription(boolean b) {
            useExtensionsInDescription = b;
            fullDescription = null;
        }

        public boolean isExtensionListInDescription() {
            return useExtensionsInDescription;
        }

        //  private String TYPE_UNKNOWN;
        //  private String HIDDEN_FILE;
        private Hashtable<String, Object> filters;
        private String description;
        private String fullDescription;
        private boolean useExtensionsInDescription;

        public ToolFileFilter() {
            this((String) null, null);
        }

        public ToolFileFilter(String extension) {
            this(extension, null);
        }

        public ToolFileFilter(String extension, String description) {
            this(new String[]{extension}, description);
        }

        public ToolFileFilter(String filters[]) {
            this(filters, null);
        }

        public ToolFileFilter(String filter[], String description) {
            //    TYPE_UNKNOWN = "Type Unknown";
            //    HIDDEN_FILE = "Hidden File";
            this.filters = null;
            this.description = null;
            fullDescription = null;
            useExtensionsInDescription = true;
            if (filter != null) {
                this.filters = new Hashtable<String, Object>(filter.length);
                for (int i = 0; i < filter.length; i++) {
                    addExtension(filter[i]);
                }
            }
            setDescription(description);
        }
    }

    public static String chooseFile(Component parent,
                                    int mode,
                                    String[] filters,
                                    String desc,
                                    String title,
                                    String buttonLabel) {
        String fileName = "";
        JFileChooser chooser = new JFileChooser();
        if (title != null) {
            chooser.setDialogTitle(title);
        }
        if (buttonLabel != null) {
            chooser.setApproveButtonText(buttonLabel);
        }
        if (filters != null) {
            ToolFileFilter filter = new ToolFileFilter(filters, desc);
            chooser.addChoosableFileFilter(filter);
            chooser.setFileFilter(filter);
        }
        chooser.setFileSelectionMode(mode);
        // Set current directory
        File f = new File(".");
        String currPath = f.getAbsolutePath();
        f = new File(currPath.substring(0, currPath.lastIndexOf(File.separator)));
        chooser.setCurrentDirectory(f);

        int retVal = chooser.showOpenDialog(parent);
        switch (retVal) {
            case JFileChooser.APPROVE_OPTION:
                fileName = chooser.getSelectedFile().toString();
                break;
            case JFileChooser.CANCEL_OPTION:
            case JFileChooser.ERROR_OPTION:
            default:
                break;
        }
        return fileName;
    }
}
