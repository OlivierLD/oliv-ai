## Cloudera - Spark class, Oct-2020
The goal is to reproduce what was done during the Cloudera class I took in Oct-2020, without Cloudera Data Science Workbench (CDSW).

The docker image we will need can be built as indicated at <https://github.com/OlivierLD/raspberry-coffee/tree/master/docker>.
Use `./image.builder.sh`, option `9`.
Start it as indicated in `https://github.com/OlivierLD/raspberry-coffee/tree/master/docker/misc`.

#### Transfer the data to the docker image
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                    NAMES
df364841cbd9        oliv-spark:latest   "/bin/bash"         9 minutes ago       Up 9 minutes        0.0.0.0:8080->8080/tcp   vigorous_brown
$
$ docker cp ~/Desktop/.../sparkm-ml/duocar-raw-part-01.zip df364841cbd9:/workdir/spark-3.0.1-bin-hadoop2.7-hive1.2/ai-data.zip
$
```

Then, in the docker image, unzip the data:
```
$ cd spark-3.0.1-bin-hadoop2.7-hive1.2
$ unzip ai-data.zip
. . .
```
#### In Python3
```
$ ./bin/pyspark
```
> Note: Make sure you've modified the `bin/pyspark` so it uses `python3`.

Execute the following lines:

_Optional:_
```python
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("spark-test").getOrCreate()
```
Then
```python
FILE_LOCATION = "file:///workdir/spark-3.0.1-bin-hadoop2.7-hive1.2/duocar/raw/rides/"
rides = spark.read.csv(FILE_LOCATION, \
                       sep=",", \
                       header=True, \
                       inferSchema=True)
rides.printSchema()
```

The `printSchema` should return
```
root
 |-- id: integer (nullable = true)
 |-- driver_id: long (nullable = true)
 |-- rider_id: long (nullable = true)
 |-- date_time: string (nullable = true)
 |-- utc_offset: integer (nullable = true)
 |-- service: string (nullable = true)
 |-- origin_lat: double (nullable = true)
 |-- origin_lon: double (nullable = true)
 |-- dest_lat: double (nullable = true)
 |-- dest_lon: double (nullable = true)
 |-- distance: integer (nullable = true)
 |-- duration: integer (nullable = true)
 |-- cancelled: integer (nullable = true)
 |-- star_rating: integer (nullable = true)

```

#### Same in Scala
In `./bin/spark-shell`, run 
```scala
val FILE_LOCATION = "file:///workdir/spark-3.0.1-bin-hadoop2.7-hive1.2/duocar/raw/rides/"
val rides = spark.read
                 .option("delimiter", ",")
                 .option("inferSchema", true)
                 .option("header", true)
                 .csv(FILE_LOCATION)
rides.count()
rides.printSchema()
```

```
root@f43725f78e97:/workdir/spark-3.0.1-bin-hadoop2.7-hive1.2# ./bin/spark-shell
. . .
Spark context available as 'sc' (master = local[*], app id = local-1602513424078).
Spark session available as 'spark'.
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 3.0.1
      /_/
         
Using Scala version 2.12.10 (OpenJDK 64-Bit Server VM, Java 11.0.8)
Type in expressions to have them evaluated.
Type :help for more information.


scala> val rides = spark.read.option("delimiter", ",").option("inferSchema", true).option("header", true).csv("file:///workdir/spark-3.0.1-bin-hadoop2.7-hive1.2/duocar/raw/rides/")
rides: org.apache.spark.sql.DataFrame = [id: int, driver_id: bigint ... 12 more fields]

scala> rides.count()
res0: Long = 48775

scala> rides.printSchema()
root
 |-- id: integer (nullable = true)
 |-- driver_id: long (nullable = true)
 |-- rider_id: long (nullable = true)
 |-- date_time: string (nullable = true)
 |-- utc_offset: integer (nullable = true)
 |-- service: string (nullable = true)
 |-- origin_lat: double (nullable = true)
 |-- origin_lon: double (nullable = true)
 |-- dest_lat: double (nullable = true)
 |-- dest_lon: double (nullable = true)
 |-- distance: integer (nullable = true)
 |-- duration: integer (nullable = true)
 |-- cancelled: integer (nullable = true)
 |-- star_rating: integer (nullable = true)

scala> 
```

Good!
 