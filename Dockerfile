FROM centos:latest
MAINTAINER Ingensi labs <contact@ingensi.com>

RUN yum update -y
RUN yum install -y wget
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm

RUN rpm -ivh jdk-8*-linux-x64.rpm && rm jdk-8*-linux-x64.rpm

ENV JAVA_HOME /usr/java/latest

#maven
RUN wget http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz && \
tar xzf apache-maven-3.0.5-bin.tar.gz -C /usr/local && \
cd /usr/local && \
ln -s apache-maven-3.0.5 maven

ENV M2_HOME /usr/local/maven
ENV PATH=$PATH:$M2_HOME/bin
#export PATH=${M2_HOME}/bin:${PATH}
