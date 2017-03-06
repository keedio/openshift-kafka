#!/bin/sh
# * ADVERTISED_HOST: the external ip for the container
# * ADVERTISED_PORT: the external port for Kafka, e.g. 9092

# Set the external host and port
if [ ! -z "$ADVERTISED_HOST" ]; then
    echo "advertised host: $ADVERTISED_HOST"
    if grep -q "^advertised.host.name" $KAFKA_HOME/config/server.properties; then
        sed -r -i "s/#(advertised.host.name)=(.*)/\1=$ADVERTISED_HOST/g" $KAFKA_HOME/config/server.properties
    else
        echo "advertised.host.name=$ADVERTISED_HOST" >> $KAFKA_HOME/config/server.properties
    fi
fi

if [ ! -z "$ADVERTISED_PORT" ]; then
    echo "advertised port: $ADVERTISED_PORT"
    if grep -q "^advertised.port" $KAFKA_HOME/config/server.properties; then
        sed -r -i "s/#(advertised.port)=(.*)/\1=$ADVERTISED_PORT/g" $KAFKA_HOME/config/server.properties
    else
        echo "advertised.port=$ADVERTISED_PORT" >> $KAFKA_HOME/config/server.properties
    fi
fi

# Run Zookeeper
start-zookeeper.sh 

# Run Kafka
$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties 

#/bin/bash