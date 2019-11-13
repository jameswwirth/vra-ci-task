FROM ubuntu:18.04
WORKDIR /workingDir
RUN apt-get update && apt-get install -y wget unzip curl \
    && wget https://iotc005.vmware.com/api/iotc-cli/package-cli.zip \
    && RUN unzip package-cli.zip