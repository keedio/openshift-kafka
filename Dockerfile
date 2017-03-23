# Apache Kafka + Apache Zookeper Dockerfile

# Pull base image
FROM centos:7

# Build-time vars
ARG KAFKA_VERSION=0.10.2.0
ARG KAFKA_MIRROR=http://apache.rediris.es/kafka/${KAFKA_VERSION}/kafka_2.11-${KAFKA_VERSION}.tgz  
ARG ZOOK_VERSION=3.4.6

# Enviroment vars
ENV KAFKA_HOME /opt/kafka-${KAFKA_VERSION}


# Metadata
LABEL name="kafka" kafka-version=$KAFKA_VERSION

# JAVA_HOME variable
ENV JAVA_VERSION 1.8.0 
ENV JAVA_HOME /usr/lib/jvm/jre

# Java & supervisor installation
RUN \
  yum clean all && \
  yum install -y java-${JAVA_VERSION}-openjdk 
  
  
RUN \
  cd /tmp && curl -O http://apache.rediris.es/kafka/${KAFKA_VERSION}/kafka_2.11-${KAFKA_VERSION}.tgz  

# Install 
RUN \
  mkdir -p /opt/kafka  && mkdir -p /opt/zookeeper && \
  tar -xzf /tmp/kafka_2.11-${KAFKA_VERSION}.tgz -C /opt && \
  mv /opt/kafka_2.11-${KAFKA_VERSION}/* /opt/kafka && \
  rm -f /tmp/kafka-* 


  
COPY scripts/zook-start.sh /opt/kafka/bin/
COPY scripts/start-kafka.sh /opt/kafka/bin/
COPY server.properties.template /opt/kafka/config/server.properties
RUN chmod -R a=u /opt/kafka && chmod +x /opt/kafka/bin/zook-start.sh && chmod +x /opt/kafka/bin/start-kafka.sh
WORKDIR /opt/kafka
VOLUME /tmp/kafka-logs /tmp/zookeeper
EXPOSE 2181 2888 3888 9092
