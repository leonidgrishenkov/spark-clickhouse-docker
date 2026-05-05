FROM docker.io/apache/spark:3.5.8-scala2.12-java17-python3-ubuntu

USER root

RUN apt-get update \
    && apt-get install -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -P /opt/spark/jars https://repo1.maven.org/maven2/com/clickhouse/clickhouse-jdbc-all/0.9.6/clickhouse-jdbc-all-0.9.6.jar \
    # WARN: эти подходят только для спарк 3.5.8, для новых версий нужно подбирать
    && wget -q -P /opt/spark/jars https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar \
    && wget -q -P /opt/spark/jars https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.1026/aws-java-sdk-bundle-1.11.1026.jar

USER spark

WORKDIR $SPARK_HOME
CMD ["/bin/bash"]
