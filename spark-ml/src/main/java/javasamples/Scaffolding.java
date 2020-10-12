package javasamples;

import org.apache.spark.sql.AnalysisException;
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
        Dataset<Row> rides = spark.read()
                .option("delimiter", ",")
                .option("inferSchema", true)
                .option("header", true)
                .csv(DATA_PATH);
        System.out.println(String.format("Count: %d", rides.count()));
        System.out.println("Print inferred schema:");
        rides.printSchema();
        System.out.println("Show 5");
        rides.show(5);
        rides.show(5, false);
        boolean vertical = true;
        rides.show(5, 1, vertical);
        System.out.println("Describe");
        Dataset<Row> limit5 = rides.limit(5);
        try {
            limit5.describe("service", "distance", "duration", "cancelled")
                  .show();
        } catch (Exception ae) {
            ae.printStackTrace();
        }
        System.out.println("Done!");
        spark.close();
    }
}