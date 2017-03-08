echo ${MYID} > /opt/conf/zookeeper-data/myid 

sudo exec /opt/zookeeper-3.4.6/bin/zkServer.sh start-foreground 