FROM docker.io/apache/spark:4.1.1-scala2.13-java21-python3-ubuntu

USER root

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -P /opt/spark/jars https://repo1.maven.org/maven2/com/clickhouse/clickhouse-jdbc-all/0.9.6/clickhouse-jdbc-all-0.9.6.jar

USER spark
