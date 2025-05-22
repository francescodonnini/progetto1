#!/bin/bash

echo "waiting for 'namenode' to be ready..."
until curl -s http://namenode:9870 >/dev/null; do
  sleep 3
done

until hdfs dfs -ls / >/dev/null; do
  echo "HDFS not ready yet..."
  sleep 6
done

echo "creating directories for spark cluster"
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/spark
hdfs dfs -chown spark:hadopp /user/spark
hdfs dfs -chmod 755 /user/spark
hdfs dfs -put /opt/dataset/data.csv /data.csv
hdfs dfs -put /opt/dataset/data.parquet /data.parquet

hdfs dfs -mkdir /user/nifi
hdfs dfs -chown nifi:hadopp /user/nifi
hdfs dfs -chmod 755 /user/nifi

echo "directories created successfully"