FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

# Add the jar with all the dependencies
# Maven creates container-test.jar in the target folder of my workspace.
# We need this in some location - say - /usr/share/tag folder of the container
WORKDIR /usr/share/tag/
ADD  target/selenium-docker-tests.jar  /usr/share/tag/selenium-docker-tests.jar
ADD  target/selenium-docker.jar /usr/share/tag/selenium-docker.jar
ADD  testng.xml /usr/share/tag/testng.xml
ADD  target/libs /usr/share/tag/libs

ADD  healthcheck.sh /usr/share/tag/healthcheck.sh
# Command line to execute the test
ENTRYPOINT sh healthcheck.sh
