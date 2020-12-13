# Playground, scratch-pad...

- <https://nanonets.com/blog/receipt-ocr/>
- <https://www.pyimagesearch.com/2020/09/07/ocr-a-document-form-or-invoice-with-tesseract-opencv-and-python/>

> To check out: Microsoft OCR, LayoutLM, … Table processing 

### Processing images, with annotations (aka labels)
#### In Java, with OpenCV 🤔

We want to refer to some annotations, stored for now in `annotations.json`.
Those annotations describe the position (`[x,y]`) and size (`[w,h]`) of the zones of a graphical document
we want to process, like `Time`, `Date`, `Amount`, etc.

Once identified, we can then crop the corresponding zones, and send the cropped images
to some ML model for recognition.

OpenCV can reshape and rework an image, and can be access from `C`, `Java`, `Python`.
A lot of transformations are available, so the image can match the elements used for the model training.

We use the annotations like
```json
[
  {
    "x": 230,
    "y": 360,
    "w": 155,
    "h": 30,
    "cellName": "Date"
  },
  {
    "x": 230,
    "y": 390,
    "w": 125,
    "h": 30,
    "cellName": "Time"
  },
  {
    "x": 400,
    "y": 770,
    "w": 140,
    "h": 40,
    "cellName": "Total"
  }
]
```
on a document like

![Original](./FormProcessingSampleData/gas.receipt.jpg)

It can be reworked in several ways (even if not mandatory here)

|                             |                             |
|:---------------------------:|:---------------------------:|
| ![One](01_original.png) | ![Two](02_gray.png) |
| ![Three](03_threshed.png) | ![Four](04_cells.png) |

The cropped images (to send for recognition):

| Date | Time | Amount |
|:----:|:----:|:------:| 
| ![Date](./Date.jpg) | ![Time](./Time.jpg) | ![Amount](./Total.jpg) |

- An online service like <https://www.newocr.com/> (or Tesseract) can return the expected data.
 
### Tesseract
You can also send the original document to Tesseract:
```
$ tesseract FormProcessingSampleData/gas.receipt.jpg gas
```
And then process the generated `gas.txt`
```
ECONO GAS

SERRXHHRKR POO

2907 SAN BRUNO AVE W
SAN BRUNO ee
94066

12/87/2020 586788149
18:20:24 AM

HAKK XRXK KKK 1543
Visa

INVOICE 6816333
AUTH 855400

PUMP# 3
REGULAR CR 8.7646
PRICE/GAL $3.099

aE Th eal)

CREDIT Ce tenTIG)
```
For example:
```
$ cat gas.txt | grep INVOICE
INVOICE 6816333
```

#### Better
Run Tesseract with the `threshed` image
```
$ tesseract ./03_threshed.png gas
  Tesseract Open Source OCR Engine v4.1.1 with Leptonica
```
The result is different:
```
$ cat gas.txt 
  ECONG GAS
  
  HR KARE KAR EE
  
  2461 54h BRUNO Ave 4
  SA BRUNO , CA
  S4E6F
  
  12/07 Shh SSB aad ae
  TeSeb3 24 An
  
  RARE MMKM KAM 1549
  Wisa
  
  THNOTCE BA RS33
  
  AUTH BS54ea0
  
  PUMP# 3
  REGULAR CR b. 7645
  PRICE/ GAL $3.94
  
  FUEL TOTAL $ 27,46
  
  CREDIT $ 27.46
  
  Customer -activaced Purchase, vapture
  Sequence Humber 16876
```


---
 

