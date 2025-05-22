if [ "$#" -ne 2 ]; then
  echo "usage: $0 <src> <dst>"
  exit 1
fi
docker compose exec namenode hdfs dfs -put $1 $2