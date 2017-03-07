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
  ADD repos/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
  ADD repos/kafka_2.10-${KAFKA_VERSION}.tgz /tmp/kafka_2.10-${KAFKA_VERSION}.tgz 
  ADD repos/zookeeper-${ZOOK_VERSION}.tgz /tmp/zookeeper-${ZOOK_VERSION}.tgz

# Install 
RUN \
  tar xvzf /tmp/kafka_2.10-${KAFKA_VERSION}.tgz  -C /opt && \
  mv /opt/kafka_2.10-${KAFKA_VERSION} /opt/kafka-${KAFKA_VERSION} && \
  rm -f /tmp/kafka-* && \
  tar xvzf /tmp/zookeeper-${ZOOK_VERSION}.tgz  -C /opt && \
  rm -f /tmp/zookeper-*    

# Create zookeeper config 
RUN \
  cp /opt/zookeeper-3.4.6/conf/zoo_sample.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg

VOLUME ["/kafka/logs /zookeper/logs"]

# Zookeper/Kafka
EXPOSE 2181 9092
