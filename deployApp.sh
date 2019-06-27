#!/bin/bash

#Build the code
mvn clean package

#Deploy the code
cp ./target/mywebapp.war /usr/local/tomcat9/webapps/
