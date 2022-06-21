FROM tomcat:9.0-jre8-alpine

COPY target/AS.war /usr/local/tomcat/webapps
RUN mkdir -p /opt/AService/storage

#VOLUME $CATALINA_HOME/webapps
