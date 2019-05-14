#!/bin/bash

## Usage $1 --> Image Name $2 port number
docker kill `docker ps | grep -e "$1\|Up" | cut -d ' ' -f1`

echo " ==== Build the WebApp war file ceraton"
mvn clean package

echo " === Creating Docker Image === "
docker build -t $1 .


echo " ==== Running the Docker Container ==="
echo " === To deploy the webApp ===="

docker run -dit -p 9090:8080 $1


echo " === Display Running Contianers"
docker ps | grep $1
#echo "=== Displaying the Container logs === "
#docker logs -f `docker ps | grep $1 | awk '{print $1}'`
