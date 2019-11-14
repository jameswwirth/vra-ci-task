FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl
ENV PATH /usr/bin:$PATH