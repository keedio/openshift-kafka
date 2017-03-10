#!/bin/bash
PROPERTIES=$1
ZOOKEEPER=$2
HOST_NAME=$3
BROKER=$4



cat >>$PROPERTIES <<EOF
broker.id=$BROKER
zookeeper.connect=$ZOOKEEPER
advertised.host.name=$HOST_NAME

EOF

echo $PROPERTIES

exec bin/kafka-server-start.sh $PROPERTIES