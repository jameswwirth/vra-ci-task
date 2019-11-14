FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl wget unzip
RUN mkdir /workingDir
RUN cd /workingDir
RUN wget https://iotc005.vmware.com/api/iotc-cli/package-cli.zip \
    && unzip package-cli.zip