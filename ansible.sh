#! /bin/bash



echo "------------------------- Showing images & Containers -------------------------------"

docker images

docker ps



echo "------------------------- Deleting images & Containers -------------------------------"

docker stop $(docker ps -a -q)


docker rm $(docker ps -a -q)

docker rmi -f $(docker images -aq)  


echo "------------------------- Showing images & Containers -------------------------------"

docker images

docker ps

echo "--------------------------- Bulding image from Dockerfile -----------------------------"

docker build -t ansible-website .

echo "----------------------------- Create Container from image -----------------------------"

docker run --name my-ansible-website -d -p 5000:80 ansible-website

echo "---------------------------------- Showing Web-Site -----------------------------------"

sleep 20s

curl localhost:5000
