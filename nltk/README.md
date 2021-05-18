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

### To read next
- <https://www.nltk.org/book/>
- <https://www.nltk.org/book/ch10.html>

## Data to analyze
`sqlite` can be used to store and retirieve data. Easy to deal with from Python.  
See `sqlite3.101.py`.


### SQLite tutorials
- <https://www.sqlitetutorial.net/sqlite-tutorial/> 

#### Install sqlite3 CLI on Raspberry Pi
See <https://sqlite.org/cli.html>

```
sudo apt-get install sqlite3
```
Then
```
sqlite3 data/mydb.db
. . .
sqlite> .schema cities
CREATE TABLE CITIES(CITY TEXT PRIMARY KEY, COUNTRY TEXT, POPULATION NUMBER);
sqlite> select * from cities;
...
sqlite> .quit
```

Info about a table:
```
sqlite> .mode column
sqlite> pragma table_info('cities');
cid         name        type        notnull     dflt_value  pk        
----------  ----------  ----------  ----------  ----------  ----------
0           CITY        TEXT        0                       1         
1           COUNTRY     TEXT        0                       0         
2           POPULATION  NUMBER      0                       0         
sqlite> 
```

Execute a script from the CLI
```
sqlite> .mode column
sqlite> .width 15 30 10
sqlite> .header on
sqlite> .read select.cities.sql
Athens           Greece                          1368      
Bangkok          Thailand                        1178      
Barcelona        Spain                           1280      
Berlin           East Germany                    3481      
Birmingham       UK                              1112      
sqlite> 

```

---
