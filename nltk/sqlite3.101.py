import sqlite3

#
# See https://www.pythoncentral.io/introduction-to-sqlite-in-python/
#

# Create a database in RAM
# db = sqlite3.connect(':memory:')
# Creates or opens a file called mydb with a SQLite3 DB
db = sqlite3.connect('data/mydb.db')

# City	        Country	        Population
# athens	    greece	        1368
# bangkok	    thailand	    1178
# barcelona	    spain	        1280
# berlin	    east_germany	3481
# birmingham	united_kingdom	1112

cursor = db.cursor()

try:
    # create_city_table = "CREATE TABLE CITIES (CITY TEXT PRIMARY KEY, COUNTRY TEXT, POPULATION NUMBER)"
    create_city_table = "CREATE TABLE IF NOT EXISTS CITIES (CITY TEXT PRIMARY KEY, COUNTRY TEXT, POPULATION NUMBER)"
    cursor.execute(create_city_table)
    db.commit()
except sqlite3.OperationalError:
    print("\tThe table probably already exists")    

insert_city_table = "INSERT INTO CITIES (CITY, COUNTRY, POPULATION) VALUES (?, ?, ?)"
try:
    cursor.execute(insert_city_table, ("Athens", "Greece", 1368))
except sqlite3.IntegrityError:
    print("\tThis row is already there.")   

several_rows = [
    ("Bangkok", "Thailand", 1178),
    ("Barcelona", "Spain", 1280),
    ("Berlin", "East Germany", 3481),
    ("Birmingham", "UK", 1112)
]
try:
    cursor.executemany(insert_city_table, several_rows)
except sqlite3.IntegrityError:
    print("\tRows are already there.")   

db.commit()

select_stmt = "SELECT CITY, COUNTRY, POPULATION FROM CITIES"
cursor.execute(select_stmt)
for row in cursor:
    print("{0}: {1}, {2}".format(row[0], row[1], row[2]))


db.close()
