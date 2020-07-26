FROM openjdk:8

ARG HADOOP_VERSION=2.10.0
ARG HBASE_VERSION=2.3.0

ENV  HADOOP_HOME=/opt/hadoop
ENV  HBASE_HOME=/opt/hbase
ENV  JAVA_HOME=/usr/local/openjdk-8


#COPY hbase-${HBASE_VERSION}-bin.tar.gz /tmp
COPY ./entrypoint.sh /entrypoint.sh

RUN mkdir -p $HADOOP_HOME
RUN mkdir -p $HBASE_HOME

ADD ./tmp/hadoop-${HADOOP_VERSION} ${HADOOP_HOME}
ADD ./tmp/hbase-${HBASE_VERSION} ${HBASE_HOME}


#WORKDIR /tmp
#RUN mkdir -p $HADOOP_HOME && tar zxf hadoop-${HADOOP_VERSION}.tar.gz -C $HADOOP_HOME --strip-components 1
#RUN mkdir -p $HBASE_HOME && tar zxf hbase-${HBASE_VERSION}-bin.tar.gz -C $HBASE_HOME --strip-components 1

#RUN rm -rf /tmp/*.gz

EXPOSE 2181 8080 8085 9090 9095 16000 16010 16030 16201 16301

ENTRYPOINT ["/entrypoint.sh"]
#CMD ["sleep", "10000"]
