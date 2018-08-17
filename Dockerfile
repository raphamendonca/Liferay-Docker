# ubuntu latest LTC + java 8u151
# VERSION 0.1

 #  initial file with ubuntu latest LTC 
 #    - java jdk 8u151
 #    - Liferay CE 7 

FROM ubuntu:latest

MAINTAINER Raphael Mendonça <raphael.alonso.mendonca@gmail.com>

# System Configuration and Java Settings
RUN apt-get update 
RUN apt-get install -y curl tar unzip
RUN (curl -s -k -L -C - -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz | tar xfz - -C /opt) 
RUN  mv /opt/jdk1.8.0_151/lib/tools.jar /opt/jdk1.8.0_151/lib/ext  
RUN ln -s /opt/jdk1.8.0_151 /opt/java
# Set JAVA_HOME
ENV JAVA_HOME /opt/java
ENV PATH $PATH:$JAVA_HOME/bin

# install liferay 7
#RUN curl -O -s -k -L -C - https://downloads.sourceforge.net/project/lportal/Liferay%20Portal/7.0.4%20GA5/liferay-ce-portal-tomcat-7.0-ga5-20171018150113838.zip 
#RUN unzip liferay-ce-portal-tomcat-7.0-ga5-20171018150113838.zip -d /opt 
#RUN unzip opt/liferay-ce-portal-tomcat-7.0-ga5.zip -d /opt 
#RUN rm liferay-ce-portal-tomcat-7.0-ga5-20171018150113838.zip 
#RUN mv /opt/liferay-ce-portal-7.0-ga5 /opt/liferay-ce-portal 
#RUN mkdir /opt/liferay-ce-portal/liferay-ce-portal-7.0-ga5 
#RUN cp -r /opt/liferay-ce-portal/tomcat-8.0.32/ /opt/liferay-ce-portal/tomcat/

RUN mkdir /opt/liferay-ce-portal/
# Liferay data will be stored in a separate data volume
VOLUME /opt/liferay-ce-portal/

# volumes
#VOLUME ["/var/liferay-home", "/opt/liferay-ce-portal/"]

# Ports	
EXPOSE 8080

# EXEC
#CMD ["run"]
#ENTRYPOINT ["/opt/liferay-ce-portal/tomcat/bin/catalina.sh"]
