#!/bin/bash

## Usage $1 --> Image Name

echo "=== Kill Running Containers ==="
#docker kill `docker ps | grep $1 | awk '{print $1}'`
for i in `docker ps -aq`; do ; docker kill $i; done

echo " ==== Build the WebApp war file ceraton"
mvn clean package

echo " === Creating Docker Image === "
docker build -t $1 .


echo " ==== Running the Docker Container ==="
echo " === To deploy the webApp ===="

docker run -dit -p 9090:8080 $1


echo " === Display Running Contianers"
#echo "=== Displaying the Container logs === "
#docker logs -f `docker ps | grep $1 | awk '{print $1}'`
