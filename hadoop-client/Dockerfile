FROM ubuntu:25.04
USER root

RUN apt-get update
RUN apt-get install -y curl \
        wget \
        tar \
        sudo \
        rsync \
        openjdk-8-jre-headless \
        vim \
        net-tools \
        python3 \
        python3-pip \
        python3-dev \
        python3-requests \
        build-essential && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV PATH=$PATH:$JAVA_HOME/bin

RUN wget https://downloads.apache.org/hadoop/common/current/hadoop-3.4.1.tar.gz \
    && tar -zxf hadoop-3.4.1.tar.gz -C /usr/local/ \
    && rm hadoop-3.4.1.tar.gz
RUN cd /usr/local && ln -s ./hadoop-3.4.1 hadoop

ENV HADOOP_COMMON_HOME=/usr/local/hadoop
ENV HADOOP_HDFS_HOME=/usr/local/hadoop
ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_MAPRED_HOME=/usr/local/hadoop
ENV HADOOP_YARN_HOME=/usr/local/hadoop
ENV HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:/usr/local/bin:/usr/bin

RUN groupadd hadoop && useradd -m -g hadoop -s /bin/bash hadoop

RUN chown -R hadoop:hadoop /usr/local/hadoop

ENV HDFS_NAMENODE_USER="hadoop"
ENV HDFS_DATANODE_USER="hadoop"
ENV HDFS_SECONDARYNAMENODE_USER="hadoop"
ENV YARN_RESOURCEMANAGER_USER="hadoop"
ENV YARN_NODEMANAGER_USER="hadoop"

USER hadoop

ADD core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
ADD hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml

CMD ["bash"]