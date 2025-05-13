#!/bin/bash

# Wait for NameNode web UI to be up (port 9870)
echo "Waiting for NameNode to be ready..."
until curl -s http://namenode:9870 >/dev/null; do
  sleep 3
done

# Wait for the HDFS command to succeed (e.g., `hdfs dfs -ls /`)
until hdfs dfs -ls / >/dev/null; do
  echo "HDFS not ready yet..."
  sleep 6
done

# Create HDFS directories
echo "Creating initial HDFS directories..."
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/spark
hdfs dfs -chown spark:hadopp /user/spark
hdfs dfs -chmod 755 /user/spark
