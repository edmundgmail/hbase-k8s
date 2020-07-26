#!/bin/bash
mkdir tmp 
cd tmp

#wget https://downloads.apache.org/hadoop/common/hadoop-2.10.0/hadoop-2.10.0.tar.gz
#wget https://downloads.apache.org/hbase/2.3.0/hbase-2.3.0-bin.tar.gz 

tar zxf hadoop-2.10.0.tar.gz 
tar zxf hbase-2.3.0-bin.tar.gz

rm -rf `find . -name doc*`
#wget https://repo1.maven.org/maven2/com/google/cloud/bigdataoss/gcs-connector/hadoop2-2.1.4/gcs-connector-hadoop2-2.1.4-shaded.jar

cp gcs-connector-hadoop2-2.1.4-shaded.jar hadoop-2.10.0/share/hadoop/yarn/lib
