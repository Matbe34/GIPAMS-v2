FROM tomcat:9.0-jre8-alpine

COPY target/GCS.war /usr/local/tomcat/webapps
RUN mkdir -p /opt/GCService/storage

#VOLUME $CATALINA_HOME/webapps
