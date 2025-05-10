/usr/local/bootstrap.sh
hdfs namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
hdfs dfs -put /opt/dataset/IT_2021.csv /IT_2021.csv
/bin/bash