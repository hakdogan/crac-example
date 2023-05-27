FROM ubuntu:20.04

ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH

RUN apt-get update -y

COPY ./org /home/greetings/org
COPY ./manifest.txt /home/greetings/manifest.txt
COPY ./org-crac-0.1.3.jar /home/greetings/org-crac-0.1.3.jar

ADD "https://github.com/CRaC/openjdk-builds/releases/download/17-crac%2B5/openjdk-17-crac+5_linux-x64.tar.gz" $JAVA_HOME/openjdk.tar.gz
RUN tar --extract --file $JAVA_HOME/openjdk.tar.gz --directory "$JAVA_HOME" --strip-components 1; rm $JAVA_HOME/openjdk.tar.gz;

WORKDIR /home/greetings

RUN javac -cp ./org-crac-0.1.3.jar ./org/jugistanbul/crac/Greetings.java

RUN jar cfm greetings.jar ./manifest.txt ./org/jugistanbul/crac/Greetings.class