Author: Stefan Saasen (stefan@coravy.com)


Installation
============

This example is configured to run in the following environment:

	* JDK 5 or 6
	* Apache Tomcat 6 (tested with 6.0.20, should work with 6.0.14 and 6.0.18)
	* Apache Ant 1.7.x
	* ActiveMQ 5.2.0
	* MySQL 5 database


ActiveMQ
--------


Download the activemq binary distribution:

	http://activemq.apache.org/activemq-520-release.html
	
Extract and move to a convenient location (e.g. /opt/activemq) = ACTIVEMQ_HOME

Copy the supplement/conf/* files to ACTIVEMQ_HOME/conf

Start ActiveMQ by running:

	ACTIVEMQ_HOME/bin/activemq
	
	stefan@macbookpro:/opt/activemq (master) [0]$ ./bin/activemq
	ACTIVEMQ_HOME: /opt/activemq
	ACTIVEMQ_BASE: /opt/activemq
	Loading message broker from: xbean:activemq.xml
	INFO  BrokerService                  - Using Persistence Adapter: AMQPersistenceAdapter(/opt/activemq/data)
	INFO  AMQPersistenceAdapter          - AMQStore starting using directory: /opt/activemq/data
	INFO  KahaStore                      - Kaha Store using data directory /opt/activemq/data/kr-store/state
	INFO  AMQPersistenceAdapter          - Active data files: []
	INFO  BrokerService                  - ActiveMQ 5.2.0 JMS Message Broker (localhost) is starting
	INFO  BrokerService                  - For help or more information please see: http://activemq.apache.org/
	INFO  KahaStore                      - Kaha Store using data directory /opt/activemq/data/kr-store/data
	INFO  TransportServerThreadSupport   - Listening for connections at: tcp://macbookpro.local:61616
	INFO  TransportConnector             - Connector openwire Started
	INFO  TransportServerThreadSupport   - Listening for connections at: stomp://macbookpro.local:61613
	INFO  TransportConnector             - Connector stomp Started
	INFO  NetworkConnector               - Network Connector default-nc Started
	INFO  BrokerService                  - ActiveMQ JMS Message Broker (localhost, ID:macbookpro.local-59722-1253068503847-0:0) started
	INFO  log                            - Logging to org.slf4j.impl.JCLLoggerAdapter(org.mortbay.log) via org.mortbay.log.Slf4jLog
	INFO  log                            - jetty-6.1.9
	INFO  WebConsoleStarter              - ActiveMQ WebConsole initialized.
	INFO  /admin                         - Initializing Spring FrameworkServlet 'dispatcher'
	INFO  log                            - ActiveMQ Console at http://0.0.0.0:8161/admin
	INFO  log                            - Started SelectChannelConnector@0.0.0.0:8161
	

Open the ActiveMQ console (http://0.0.0.0:8161/admin) to verify that everything is working properly.


Tomcat
------

Download Tomcat (http://tomcat.apache.org/download-60.cgi), unpack and move to a convenient location (e.g. /opt/apache-tomcat-6.0.20 = CATALINA_HOME)
Copy the vendor/lib-context/mysql-connector-java-5.1.8-bin.jar to your $CATALINA_HOME/lib (e.g. /opt/apache-tomcat-6.0.20/lib) directory.


Start tomcat by running:

	$CATALINA_HOME/bin/catalina.sh run
	
open http://localhost:8080/ to verify the installation


Container managed Resources
---------------------------


The classic J2EE way of handling resources is to delegate their management to the J2EE container, i.e. the application server. 
JDBC DataSources for all hosted applications get defined there, accessible by applications via JNDI. Multiple applications can 
share a single connection pool if they access the same database. The main advantage of this strategy is the central place for 
configuration, be it a server-specific config file or some administration console. An administrator can fine-tune the pool 
settings for all applications there, and monitor them at runtime. 


This example uses a Tomcat sepcific context.xml configuration file (web/META-INF/context.xml) to simplify the deployment of the
example application.

Change the following settings to match your database and ActiveMQ (only if your ActiveMQ installation is different to the settings defined in supplement/activemq) settings:


 9			brokerURL="tcp://localhost:61616" 

11	        userName="system"
12	        password="qdajsqenqlwjkqnqk234234b2kl" 

35			driverClassName="com.mysql.jdbc.Driver"
36			url="jdbc:mysql://localhost:3306/javaflexdemo" 
37			username="rails"
38			password="rails" 


Create the database schema (create a database named 'javaflexdemo' and execute the SQL file in supplement/db).

Run the "ant war" target to compile the application and to create a .war file suitable for the deployment to the Tomcat servlet container:

	ant war
	
Copy or move the target/messaging.war file to $CATALINA_HOME/webapps


open http://localhost:8080/messaging/


Done!