#!/bin/bash
echo "Creating docker environment"

#Check that we have all the required configuration
if [ -z $DATABASE_URL ]; then
  echo "Environment var DATABASE_URL is not set. Please set this var and try again"
  exit 1
elif [ -z $SECRET_KEY_BASE ]; then
  echo "Environment var SECRET_KEY_BASE is not set. Please set this var and try again"
  exit 1
elif [ -z $SECRET ]; then
  echo "Environment var SECRET is not set. Please set this var and try again"
fi

docker build -t listapp-img/latest .

#Run docker using configuratoin from host machine
docker run --name listapp -e DATABASE_URL="$DATABASE_URL" -e SECRET_KEY_BASE="$SECRET_KEY_BASE" -e SECRET="$SECRET" -p 8122:80 listapp-img/latest

if [ $? -ne 0 ]
then
  echo "Environment setup failed"
else
  echo "Environment setup successful"
fi 
