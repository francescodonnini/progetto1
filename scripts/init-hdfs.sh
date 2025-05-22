#!/bin/bash

echo "waiting for 'namenode' to be ready..."
until curl -s http://namenode:9870 >/dev/null; do
  sleep 3
done

until hdfs dfs -ls / >/dev/null; do
  echo "HDFS not ready yet..."
  sleep 6
done

<<<<<<< HEAD
echo "creating directories for spark cluster"
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/spark
hdfs dfs -chown spark:hadoop /user/spark
hdfs dfs -chmod 775 /user/spark
# hdfs dfs -put /opt/dataset/data.csv /data.csv
# hdfs dfs -put /opt/dataset/data.parquet /data.parquet

hdfs dfs -mkdir /user/nifi
hdfs dfs -chown nifi:hadoop /user/nifi
hdfs dfs -chmod 755 /user/nifi
hdfs dfs -put /opt/input/links.txt /user/nifi/links.txt

=======
# Create HDFS directories
echo "creating directories for spark cluster"
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/spark
hdfs dfs -chown spark:hadopp /user/spark
hdfs dfs -chmod 755 /user/spark
hdfs dfs -put /opt/dataset/data.csv /data.csv
hdfs dfs -put /opt/dataset/data.parquet /data.parquet
>>>>>>> ac06acffbef333b0e7833c9b749410f3d7910a86
echo "directories created successfully"