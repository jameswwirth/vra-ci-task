FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl wget unzip git
RUN apt-get install -y python python-pip