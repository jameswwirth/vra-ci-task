FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y wget unzip curl
RUN wget https://iotc005.vmware.com/api/iotc-cli/package-cli.zip
RUN unzip package-cli.zip
RUN mkdir /workingDir
RUN cd /workingDir
RUN curl -O https://d1nlynbai6ofz7.cloudfront.net/ci/cs-agent