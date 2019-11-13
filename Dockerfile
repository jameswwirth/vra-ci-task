FROM ubuntu
RUN sudo apt-get install wget
RUN wget https://iotc005.vmware.com/api/iotc-cli/package-cli.zip
RUN unzip package-cli.zip