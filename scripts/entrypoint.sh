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
