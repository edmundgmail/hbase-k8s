#!/bin/bash

BASE=`dirname $0`
BASE=`cd $BASE; pwd`

echo "base=$BASE"
NAMESPACE=hbase

cd $BASE/etc/hadoop
CMD="kubectl -n $NAMESPACE create configmap hadoop-etc-vol"
for CAT in ./*.*
do
	CAT_NAME=`basename $CAT | cut -d'.' -f 1`
	CMD="$CMD --from-file=$CAT"
done
cd $BASE/etc/hadoop && eval "$CMD"

cd $BASE/etc/hbase
CMD="kubectl -n $NAMESPACE create configmap hbase-etc-vol"
for CAT in ./*.*
do
	CAT_NAME=`basename $CAT | cut -d'.' -f 1`
	CMD="$CMD --from-file=$CAT"
done
cd $BASE/etc/hbase && eval "$CMD"

