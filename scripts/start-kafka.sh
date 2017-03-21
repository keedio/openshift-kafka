#!/bin/bash
sed -i 's/${BROKER_ID}/'$BROKER'/g' /opt/kafka/config/server.properties
sed -i 's/${ZOOKEEPER}/'$ZOOKEEPER'/g' /opt/kafka/config/server.properties
sed -i 's/${HOST_NAME}/'$HOST_NAME'/g'/opt/kafka/config/server.properties
sed -i 's/${PORT}/'$PORT'/g' /opt/kafka/config/server.properties

cat /opt/kafka/config/server.properties

exec bin/kafka-server-start.sh $PROPERTIES




