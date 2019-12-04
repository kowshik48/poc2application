FROM tomcat

RUN apt-get update

COPY app.war /usr/local/tomcat/webapps/

