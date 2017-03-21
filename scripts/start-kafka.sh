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
ZOOKEEPER
BROKER_ID
HOST_NAME

sed -i 's/${BROKER_ID}/'$BROKER'/g' $PROPERTIES 

cat $PROPERTIES

exec bin/kafka-server-start.sh $PROPERTIES

#!/bin/bash



sed -i 's/${SEEDS}/'${Array[0]}'/g' $PROPERTIES 




