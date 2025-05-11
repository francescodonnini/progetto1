if [ "$#" -ne 1 ]; then
  echo "usage: $0 <query-number>"
  exit 1
fi
docker compose exec spark-master /opt/spark/bin/spark-submit --master spark://spark-master:7077 --deploy-mode client --class io.github.francescodonnini.QueryDispatcher /opt/app/query.jar $1