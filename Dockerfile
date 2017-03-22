# Apache Kafka + Apache Zookeper Dockerfile

# Pull base image
FROM centos:7

# Build-time vars
ARG KAFKA_VERSION=0.8.2.0
ARG KAFKA_MIRROR=http://apache.rediris.es/kafka/${KAFKA_VERSION}
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
  
  

# ADD repos files
  
  COPY repos/kafka_2.10-${KAFKA_VERSION}.tar.gz /tmp/kafka_2.10-${KAFKA_VERSION}.tar.gz 
  COPY repos/zookeeper-${ZOOK_VERSION}.tar.gz /tmp/zookeeper-${ZOOK_VERSION}.tar.gz

# Install 
RUN \
  mkdir -p /opt/kafka  && mkdir -p /opt/zookeeper && \
  tar xvzf /tmp/kafka_2.10-${KAFKA_VERSION}.tar.gz  -C /opt && \
  mv /opt/kafka_2.10-${KAFKA_VERSION}/* /opt/kafka && \
  rm -f /tmp/kafka-* && \
  tar xvzf /tmp/zookeeper-${ZOOK_VERSION}.tar.gz  -C /opt && \
  rm -f /tmp/zookeper-*  && \
  mv /opt/zookeeper-${ZOOK_VERSION}/* /opt/zookeeper 

RUN echo "192.168.1.241 kafka-shuriken.apps.keedio.lab" >> /etc/hosts  && curl http://kafka-shuriken.apps.keedio.lab

  
COPY scripts/zook-start.sh /opt/kafka/bin/
COPY scripts/start-kafka.sh /opt/kafka/bin/
COPY server.properties.template /opt/kafka/config/server.properties
RUN chmod -R a=u /opt/kafka && chmod +x /opt/kafka/bin/zook-start.sh && chmod +x /opt/kafka/bin/start-kafka.sh
WORKDIR /opt/kafka
VOLUME /tmp/kafka-logs /tmp/zookeeper
EXPOSE 2181 2888 3888 9092
