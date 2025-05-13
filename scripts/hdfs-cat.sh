if [ "$#" -ne 1 ]; then
  echo "usage: $0 <path>"
  exit 1
fi
docker compose exec namenode hdfs dfs -cat $1