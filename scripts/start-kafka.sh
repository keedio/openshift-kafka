#!/bin/bash
PROPERTIES=$1
ZOOKEEPER=$2
HOST_NAME=$3
BROKER=$4
PORT=$5


sed -i 's/${BROKER_ID}/'$BROKER'/g' $PROPERTIES 
sed -i 's/${ZOOKEEPER}/'$ZOOKEEPER'/g' $PROPERTIES 
sed -i 's/${HOST_NAME}/'$HOST_NAME'/g' $PROPERTIES 
sed -i 's/${PORT}/'$PORT'/g' $PROPERTIES 

cat $PROPERTIES

exec bin/kafka-server-start.sh $PROPERTIES




