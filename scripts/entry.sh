echo ${MYID} > /opt/conf/zookeeper-data/myid 

sudo exec /opt/zookeeper/bin/zkServer.sh start-foreground 