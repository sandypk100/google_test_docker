#!/usr/bin/env bash
# Environment Variables
# HUB_HOST
# BROWSER
# MODULE
HUB_HOST="165.232.135.90"
echo "Checking if hub is ready - $HUB_HOST"

while [ "$( curl -s http://$HUB_HOST:4444/wd/hub/status | jq -r .value.ready )" != "true" ]
do
	sleep 1
done
echo "hub is ready"

# start the java command
java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* \
    -DHUB_HOST=165.232.135.90 \
    -DBROWSER=chrome \
    org.testng.TestNG $MODULE
