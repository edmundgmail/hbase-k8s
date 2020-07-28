#!/bin/bash

ARGS=""
HBASE_CONFIG_DIR=/etc/hbase
HADOOP_CONFIG_DIR=/etc/hadoop 

if [ "$1" == "regionserver" ]; then
  ARGS = "--hosts ${HBASE_REGIONSERVERS}"
elif [ "$1" == "master-backup" ]; then
  ARGS = "--hosts ${HBASE_BACK_MASTERS}"    	
fi

if [ -d $HBASE_CONFIG_DIR ]; then
  /bin/cp -f $HBASE_CONFIG_DIR/* $HBASE_HOME/conf 	 
fi       	

if [ -d $HADOOP_CONFIG_DIR ]; then
  /bin/cp -f $HADOOP_CONFIG_DIR/* $HADOOP_HOME/etc/hadoop
fi       	

$HBASE_HOME/bin/hbase-daemon.sh --config $HBASE_HOME/conf ${ARGS} start $1 && tail -f /dev/null
