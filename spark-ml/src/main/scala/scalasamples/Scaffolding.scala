package scalasamples

import org.apache.spark.sql.Row
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.Dataset


object Scaffolding {
  private val DATA_PATH: String = s"file://${System.getProperty("user.dir")}/duocar/raw/rides"

  def main(args:Array[String]): Unit = {
    val spark: SparkSession = SparkSession.builder
                                          .appName("SimpleApp")
                                          .config("spark.master", "local")
                                          .getOrCreate
    val csv: Dataset[Row] = spark.read
                                 .option("delimiter", ",")
                                 .option("inferSchema", true)
                                 .option("header", true)
                                 .csv(DATA_PATH)
    println(s"Count: ${csv.count}")
    csv.printSchema()
    spark.close()
  }
}
