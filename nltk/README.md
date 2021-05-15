# NLTK. Python's Natural Language Toolkit

Inspired by <https://realpython.com/nltk-nlp-python/>

### Installation
```
pip3 install -r requirements.txt
```

Then, as explained in <https://www.nltk.org/data.html>:
```
python3
Python 3.7.9 (default, Nov 20 2020, 18:45:38) 
[Clang 12.0.0 (clang-1200.0.32.27)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import nltk
>>> nltk.download()
```
To check:
```
>>> from nltk.corpus import brown
>>> brown.words()
['The', 'Fulton', 'County', 'Grand', 'Jury', 'said', ...]
>>> 
```

> A trick: execute a script, and do NOT exit:
```
python3 -i nltk.101.py
```
