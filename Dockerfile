FROM tomcat

RUN apt-get update

COPY WebApp.war /usr/local/tomcat/webapps/

