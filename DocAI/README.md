# Playground, scratch-pad...

- <https://nanonets.com/blog/receipt-ocr/>
- <https://www.pyimagesearch.com/2020/09/07/ocr-a-document-form-or-invoice-with-tesseract-opencv-and-python/>

> To check out: Microsoft OCR, LayoutLM, … Table processing 

### Processing images, with annotations (aka labels)
#### In Java, with OpenCV 🤔

We want to refer to some annotations, stored for now in `annotations.json`.
Those annotations describe the position (`[x,y]`) and size (`[w,h]`) of the zones of a graphical document
we want to process, like `Invoice Number`, `Due Date`, `Amount`, etc.

Once identified, we can then crop the corresponding zones, and send the cropped images
to some ML model for recognition.

OpenCV can reshape and rework an image, and can be access from `C`, `Java`, `Python`.
A lot of transformations are available, so the image can match the elements used for the model training.

We use the annotations like
```json
[
  {
    "x": 1020,
    "y": 120,
    "w": 110,
    "h": 38,
    "cellName": "Invoice#"
  },
  {
    "x": 1000,
    "y": 225,
    "w": 140,
    "h": 31,
    "cellName": "Date"
  },
  {
    "x": 1000,
    "y": 267,
    "w": 140,
    "h": 31,
    "cellName": "DueDate"
  },
  {
    "x": 1000,
    "y": 311,
    "w": 165,
    "h": 49,
    "cellName": "AmountDue"
  }
]
```
on a document like
![Original](./FormProcessingSampleData/Contoso/Train/Contoso%202.png)

It can be reworked in several ways (even if not mandatory here)

![One](./screenshot_01.png)
![Three](./screenshot_03.png)
![Two](./screenshot_02.png)

The cropped images (to send for recognition):

![Invoce Number](./Invoice%23.jpg)

![Date](./Date.jpg)

![Due Date](./DueDate.jpg)

![Amount](./AmountDue.jpg)

---
 

