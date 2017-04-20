# OpenShift Kafka bucket

Proof of concept with Apache Kafka and Apache ZooKeeper on OpenShift v3.4
Architecture:
* 2 Kafka pods (brokers)
* 1 Zookeeper pod

## Quick start

Firs of all, you should have persistent storage assigned.

1. Create a new OpenShift project

2. Import the templates in your OpenShift project throw the UI. Once yo have do it, the build and deployment should start automatically.

3. Once the deployment has finished, create a route throw the UI.

## Openshift UI

From the UI, we can test our solution:

![alt tag](https://lh4.googleusercontent.com/zbZbSANwtnMHm5T3LhtJ1qQDp4D3zESO_qNDOM8taIaro_XzcFSyGYeitVVYqgC28LwRhOCtg6nHt7k=w2880-h1578)



