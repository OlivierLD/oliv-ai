# From PyImageSearch
## OCR with Tesseract
- Original document [here](https://www.pyimagesearch.com/2020/09/07/ocr-a-document-form-or-invoice-with-tesseract-opencv-and-python/).
---
- [Tesseract project](https://opensource.google/projects/tesseract).
    - [`pytesseract`](https://pypi.org/project/pytesseract/) is a Python wrapper around the `C++` code of Tesseract.
    - There is also a `Tess4J`, wrapper for Java, see [here](https://www.baeldung.com/java-ocr-tesseract).
- `OpenCV` is used to crop and display the images.

Required python modules:
```
pip3 install numpy
pip3 install pytesseract
pip3 install opencv-python
```
Once requirements are met, from the `ocr-document` folder, you can type
```
$ python3 ocr_form.py --image scans/scan_01.jpg --template form_w4.png
```
or, for more details: 
```
$ python3 ocr_form.py --image scans/scan_01.jpg --template form_w4.png --verbose true
``` 

---
If `Tesseract` is installed on your system (as explained [here](https://www.baeldung.com/java-ocr-tesseract)), try this
```
$ tesseract form_w4.png output
```
and see for yourself the content of `output.txt`.
