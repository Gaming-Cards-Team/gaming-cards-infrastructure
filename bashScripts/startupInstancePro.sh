#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install docker.io -y

sudo docker network create --driver bridge product-gallery-network
sudo docker run -d -p 8080:8080 --network product-gallery-network --name product-gallery-manager "jmgorduez/product-gallery-manager:PRO"
sudo docker run -d -p 80:80 --network product-gallery-network --name ui-gaming-cards "jmgorduez/ui-gaming-cards:PRO"