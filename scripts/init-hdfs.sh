#!/bin/bash

echo "waiting for 'namenode' to be ready..."
until curl -s http://namenode:9870 >/dev/null; do
  sleep 3
done

until hdfs dfs -ls / >/dev/null; do
  echo "HDFS not ready yet..."
  sleep 6
done

hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/spark
hdfs dfs -chown spark:hadoop /user/spark
hdfs dfs -chmod 755 /user/spark

hdfs dfs -mkdir /user/nifi
hdfs dfs -chown nifi:hadoop /user/nifi
hdfs dfs -chmod 755 /user/nifi
hdfs dfs -mkdir /user/nifi/input/
hdfs dfs -put /opt/input/links.txt /user/nifi/input/links.txt

echo "starting processor"
python3 /opt/scripts/start_processor.py
echo "processor started"