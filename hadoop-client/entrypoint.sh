#!/bin/bash

echo "waiting for 'namenode' to be ready..."
until curl -s $HDFS_NAMENODE_ADDRESS >/dev/null; do
  sleep 3
done

until hdfs dfs -ls / >/dev/null; do
  echo "HDFS not ready yet..."
  sleep 3
done

hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/spark
hdfs dfs -chown spark:hadoop /user/spark
hdfs dfs -chmod 755 /user/spark
hdfs dfs -mkdir /user/spark/events
hdfs dfs -chown spark:hadoop /user/spark/events
hdfs dfs -chmod 755 /user/spark/events

hdfs dfs -mkdir /user/nifi
hdfs dfs -chown nifi:hadoop /user/nifi
hdfs dfs -chmod 755 /user/nifi
hdfs dfs -mkdir /user/nifi/input/

hdfs dfs -put /opt/input/$LINKS_FILE /user/nifi/input/links.txt

echo "starting processor"
python3 /usr/local/scripts/start-processor.py
echo "processor started"

if [ "${SPARK_EVENTLOG_ENABLED:-}" = "true" ]; then
  $SPARK_HOME/bin/spark-class org.apache.spark.deploy.history.HistoryServer
fi