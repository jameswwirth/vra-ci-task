FROM ubuntu:18.04
ENV /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
RUN apt-get update && apt-get install -y wget unzip curl \
    && wget https://iotc005.vmware.com/api/iotc-cli/package-cli.zip \
    && unzip package-cli.zip
CMD ["/bin/sh"]