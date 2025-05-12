docker compose exec namenode hdfs dfs -mkdir /user
docker compose exec namenode hdfs dfs -mkdir /user/spark
docker compose exec namenode hdfs dfs -chown spark:hadopp /user/spark
docker compose exec namenode hdfs dfs -chmod 755 /user/spark
docker compose exec namenode hdfs dfs -put /opt/dataset/data.csv /data.csv
