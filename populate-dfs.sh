for file in $(ls /opt/dataset); do
    hdfs dfs -put /opt/dataset/$file /$file
done