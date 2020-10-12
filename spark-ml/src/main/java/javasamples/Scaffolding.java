package javasamples;

import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.Dataset;

public class Scaffolding {

    private final static String DATA_PATH = String.format("file://%s/duocar/raw/rides", System.getProperty("user.dir"));

    public static void main(String... args) {
        SparkSession spark = SparkSession.builder()
                .appName("SimpleApp")
                .config("spark.master", "local")
                .getOrCreate();
        Dataset<Row> csv = spark.read()
                .option("delimiter", ",")
                .option("inferSchema", true)
                .option("header", true)
                .csv(DATA_PATH);
        System.out.println(String.format("Count: %d", csv.count()));
        csv.printSchema();

        spark.close();
    }
}