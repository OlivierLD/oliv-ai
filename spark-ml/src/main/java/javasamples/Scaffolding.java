package javasamples;

import org.apache.spark.sql.*;
import static org.apache.spark.sql.functions.col;

public class Scaffolding {

    private final static String RIDES_PATH = String.format("file://%s/duocar/raw/rides", System.getProperty("user.dir"));
    private final static String RIDERS_PATH = String.format("file://%s/duocar/raw/riders", System.getProperty("user.dir"));

    public static void main(String... args) {
        SparkSession spark = SparkSession.builder()
                .appName("SimpleApp")
                .config("spark.master", "local")
                .getOrCreate();
        Dataset<Row> rides = spark.read()
                .option("delimiter", ",")
                .option("inferSchema", true)
                .option("header", true)
                .csv(RIDES_PATH);
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

        System.out.println("--- R I D E R S ---");
        Dataset<Row> riders = spark.read()
                .option("delimiter", ",")
                .option("inferSchema", true)
                .option("header", true)
                .csv(RIDERS_PATH);
        Dataset<Row> select = riders.select("birth_date", "student", "sex");
        select.printSchema();
        select.show(5);

        // Adding a column
        try {
            Dataset<Row> rowDataset = riders.select("birth_date", "student", "sex")
                    .withColumn("student_bool", select.col("student").equalTo(1));
            rowDataset.show(5);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        // Adding a column, method B
        try {
            Dataset<Row> select2 = riders.select(col("student").equalTo(1).alias("student_bool"), col("birth_date"), col("sex"));
            select2.printSchema();
            select2.show(5);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        // Adding a column, method C
        try {
            riders.selectExpr("student", "student = 1 as student_boolean").show(5);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        // Adding a column, method D
        try {
            riders.createOrReplaceTempView("riders_view");
            spark.sql("select student, student = 1 as student_boolean from riders_view").show(5);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        // Filtering
        try {
            Dataset<Row> select2 = riders.select(col("student").equalTo(1).alias("student_bool"),
                    col("birth_date"), col("sex"))
                    .filter(col("student_bool").equalTo(true))
                    .where(col("sex").isNotNull()); // .where() does the same thing
            select2.printSchema();
            select2.show(5);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        // Etc... sample, sampleBy, groupBy, count, dropna, fillNa, drop, replace

        System.out.println("Done!");
        spark.close();
    }
}