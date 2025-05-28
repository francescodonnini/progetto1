if [ "$#" -ne 3 ] && [ "$#" -ne 5 ]; then
  echo "usage: $0 --query <query> (-R|-D) [--time <runs>]"
  exit 1
fi
docker compose exec spark-master /opt/spark/bin/spark-submit --master spark://spark-master:7077 --deploy-mode client --class io.github.francescodonnini.QueryDispatcher /opt/app/query.jar $@