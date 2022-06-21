FROM tomcat:9.0-jre8-alpine

COPY target/GCSC4GH.war /usr/local/tomcat/webapps
RUN apk --no-cache add python2-dev
RUN apk --no-cache add python3-dev
RUN pip3 install --upgrade pip setuptools
RUN apk --no-cache add gcc musl-dev
RUN apk add libffi-dev
RUN pip install crypt4gh
