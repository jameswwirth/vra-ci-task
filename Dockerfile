FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y wget unzip
RUN wget https://iotc005.vmware.com/api/iotc-cli/package-cli.zip
RUN unzip package-cli.zip