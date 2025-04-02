#!/bin/bash

echo "Deploy.sh has started"
echo "===========================>"
docker-compose up -d
if [ $? -eq 0 ]; then
     echo "Deploy has completed"
else 
     echo "Deploy failed"
fi
echo "===========================>"
echo "tagging started"
docker tag psselva02/dev:v1 psselva02/prod:v1
if [ $? -eq 0 ]; then
     echo "tagged"
else 
     echo "tagged failed"
fi
echo "===========login================>"

docker login -u $docker_usr -p $docker_pwd
echo "===========================>"
docker push psselva02/prod:v1
if [ $? -eq 0 ]; then
     echo "image pushed to prod private rep"
else 
     echo "error to push in private prod repo"
fi

