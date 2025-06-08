if [ "$#" -ne 2 ]; then
  echo "usage: $0 <#spark-workers> <#datanode>"
  exit 1
fi
docker compose up -d --scale spark-worker=$1 --scale datanode=$2