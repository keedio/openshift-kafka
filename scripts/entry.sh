echo ${MYID} > /opt/conf/zookeeper-data/myid 

exec /opt/zookeeper/bin/zkServer.sh start-foreground