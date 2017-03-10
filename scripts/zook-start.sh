#!/bin/bash -e

PROPERTIES=$1
PREFIX=$2
MYID=$3
MAXID=$5

echo $MYID >/tmp/zookeeper/myid
for i in 1 2 3 4 5
 do
  echo server.$i=$PREFIX-$i:2888:3888
done >>$PROPERTIES
cat >>$PROPERTIES <<EOF
quorumListenOnAllIPs=true
tickTime=2000
initLimit=10
syncLimit=5
EOF

 exec bin/zookeeper-server-start.sh $PROPERTIES