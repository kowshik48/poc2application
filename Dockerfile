FROM tomcat

RUN apt-get update

RUN mkdir -p /opt/tomcat
ENV PROJECT_HOME /opt/tomcat

COPY target/WebApp.war $PROJECT_HOME/

WORKDIR $PROJECT_HOME

EXPOSE 8080
RUN service tomcat8 start


