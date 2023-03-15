FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y sudo

#get java
RUN sudo apt install -y openjdk-8-jdk

RUN sudo apt-get install -y wget
RUN sudo apt-get install -y unzip
RUN sudo apt-get install -y curl

#build varaibles
ENV SBT_VERSION 1.1.5
ENV PROJECT_HOME /usr/src

#database variables
ENV DB_URL "jdbc:mysql://localhost:3306/femr_db?characterEncoding=UTF-8&useSSL=false"
ENV DB_USER "username"
ENV DB_PASS "password"

RUN mkdir -p $PROJECT_HOME/activator $PROJECT_HOME/app

WORKDIR $PROJECT_WORKPLACE/activator

# Install Play Framework
RUN curl -O http://downloads.typesafe.com/typesafe-activator/1.3.6/typesafe-activator-1.3.6.zip 
RUN unzip typesafe-activator-1.3.6.zip -d / && rm typesafe-activator-1.3.6.zip && ls && sudo chmod a+x /activator-dist-1.3.6/activator
ENV PATH $PATH:/activator-1.3.6

# Install curl
RUN \
  apt-get update && \
  apt-get -y install curl

# Install sbt
RUN \
  mkdir /working/ && \
  cd /working/ && \
  curl -L -o sbt-$SBT_VERSION.deb https://repo.scala-sbt.org/scalasbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  cd && \
  rm -r /working/ && \
  sbt sbtVersion

# Setup path variables and copy fEMR into container
ENV PATH $PROJECT_HOME/activator/activator-dist-1.3.10/bin:$PATH
ENV PATH $PROJECT_WORKPLACE/build/target/universal/stage/bin:$PATH
COPY . $PROJECT_HOME/app
WORKDIR $PROJECT_HOME/app

RUN \
    rm $PROJECT_HOME/app/conf/application.conf && \
    mv $PROJECT_HOME/app/conf/application.docker.conf $PROJECT_HOME/app/conf/application.conf

RUN sbt clean compile

#open port 9000 for connections
EXPOSE 9000

# run fEMR using env variables
ENTRYPOINT url=$DB_URL usr=$DB_USER pass=$DB_PASS sbt ~run
