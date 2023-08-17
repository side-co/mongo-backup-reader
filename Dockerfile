FROM ubuntu:mantic

RUN apt-get update && apt-get install -y gnupg curl wget

RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc |  apt-key add -

RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-4.4.list

RUN apt-get update && apt-get upgrade -y

## Install required Libssl version

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb &&  dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb && rm *.deb

RUN apt-get install -y mongodb-org=4.4.23 mongodb-org-server=4.4.23 mongodb-org-shell=4.4.23 mongodb-org-mongos=4.4.23 mongodb-org-tools=4.4.23

RUN mkdir -p /data/db

EXPOSE 27017

ENTRYPOINT ["/usr/bin/mongod"]
