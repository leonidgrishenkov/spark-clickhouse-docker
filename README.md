Docker image with Apache Spark and extras to work with Clickhouse.


```sh
export AWS_ACCESS_KEY_ID=HPUAYM4WHLKKH5UMEXON
export AWS_SECRET_ACCESS_KEY=uruplvYValnqmwZjZAFrlro9fC1aXr6W6doVlwpv

/opt/spark/bin/pyspark \
    --conf "spark.hadoop.fs.s3a.access.key=$AWS_ACCESS_KEY_ID" \
    --conf "spark.hadoop.fs.s3a.secret.key=$AWS_SECRET_ACCESS_KEY" \
    --conf "spark.hadoop.fs.s3a.endpoint=https://obs.ru-moscow-1.hc.sbercloud.ru" \
    --conf "spark.hadoop.fs.s3a.path.style.access=true" \
    --conf "spark.hadoop.fs.s3a.connection.ssl.enabled=false" \
    --conf "spark.hadoop.fs.s3a.aws.credentials.provider=org.apache.hadoop.fs.s3a.SimpleAWSCredentialsProvider" \
    --conf "spark.hadoop.fs.s3a.impl=org.apache.hadoop.fs.s3a.S3AFileSystem" \
    --conf "spark.mongodb.read.connection.uri=mongodb://mongodb:27017" \
    --conf "spark.mongodb.write.connection.uri=mongodb://mongodb:27017"
```


```python
url = "jdbc:clickhouse://clickhouse-common.analytics.sbc.dc:8123"
user = ""
password = ""
driver = "com.clickhouse.jdbc.ClickHouseDriver"

query = ""

df = spark.read.format('jdbc').option('driver', driver).option('url', url).option('user', user).option('password', password).option('query', query).load()

df.show()


df.write.format("mongodb") \
    .mode("append") \
    .option("database", "test") \
    .option("collection", "testcol") \
    .save()
```
