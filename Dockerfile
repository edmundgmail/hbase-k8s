FROM openjdk:8

RUN  apt-get update && apt-get install -y sudo
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/hbase && \
    echo "hbase:x:${uid}:${gid}::/home/hbase:/bin/bash" >> /etc/passwd && \
    echo "hbase:x:${uid}:" >> /etc/group && \
    echo "hbase ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/hbase && \
    chmod 0440 /etc/sudoers.d/hbase && \
    chown ${uid}:${gid} -R /home/hbase 

ENV  HADOOP_HOME=/opt/hadoop
ENV  HBASE_HOME=/opt/hbase
ENV  JAVA_HOME=/usr/local/openjdk-8

ENV HADOOP_VERSION=2.10.0
ENV HBASE_VERSION=2.3.0

RUN mkdir -p $HADOOP_HOME
RUN mkdir -p $HBASE_HOME 

ADD ./tmp/hadoop-${HADOOP_VERSION} ${HADOOP_HOME}
ADD ./tmp/hbase-${HBASE_VERSION} ${HBASE_HOME}
ADD ./entrypoint.sh /entrypoint.sh

RUN chown -R hbase:hbase ${HADOOP_HOME}
RUN chown -R hbase:hbase ${HBASE_HOME}

USER hbase

#COPY hbase-${HBASE_VERSION}-bin.tar.gz /tmp

#WORKDIR /tmp
#RUN mkdir -p $HADOOP_HOME && tar zxf hadoop-${HADOOP_VERSION}.tar.gz -C $HADOOP_HOME --strip-components 1
#RUN mkdir -p $HBASE_HOME && tar zxf hbase-${HBASE_VERSION}-bin.tar.gz -C $HBASE_HOME --strip-components 1

#RUN rm -rf /tmp/*.gz

EXPOSE 2181 8080 8085 9090 9095 16000 16010 16030 16201 16301

ENTRYPOINT ["/entrypoint.sh"]
#CMD ["sleep", "10000"]
