FROM apache/nifi:2.4.0

RUN curl https://repo1.maven.org/maven2/org/apache/nifi/nifi-hadoop-nar/2.4.0/nifi-hadoop-nar-2.4.0.nar -o $NIFI_HOME/lib/nifi-hadoop-nar-2.4.0.nar
RUN curl https://repo1.maven.org/maven2/org/apache/nifi/nifi-hadoop-libraries-nar/2.4.0/nifi-hadoop-libraries-nar-2.4.0.nar -o $NIFI_HOME/lib/nifi-hadoop-libraries-nar-2.4.0.nar

COPY hadoop/core-site.xml /opt/hadoop/
COPY hadoop/hdfs-site.xml /opt/hadoop/
COPY templates/NiFi_Flow_WES.json $NIFI_HOME/conf/
COPY templates/NiFi_Flow_WOUTES.json $NIFI_HOME/conf/