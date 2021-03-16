#!/bin/bash
git clone https://github.com/Dofamin/Jackett-Docker.git /srv/Jackett/

docker build /srv/Jackett/ --tag jackett 

docker rm --force Jackett

docker create \
  --name=Jackett \
  -p 9117:9117/tcp \
  -p 9117:9117/udp \
  -e AUTO_UPDATE=true \
  -v /srv/Jackett/container-image-root/:/home/Jackett/Jackett/\
  --restart unless-stopped \
  jackett:latest

docker start Jackett
