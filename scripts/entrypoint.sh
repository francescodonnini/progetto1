chown -R spark:spark /opt/spark/events
chmod -R 775 /opt/spark/events
case $1 in
    "master")
    /opt/spark/bin/spark-class org.apache.spark.deploy.master.Master
    ;;

    "worker")
    /opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker $2
    ;;

    "history")
    sleep 5
    /opt/spark/bin/spark-class org.apache.spark.deploy.history.HistoryServer
    ;;
esac
