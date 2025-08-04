## MongoDB 5.0 Community Edition supports the following 64-bit Ubuntu LTS (long-term support) releases on x86_64 architecture:
## 20.04 LTS ("Focal")
## 18.04 LTS ("Bionic")
FROM ubuntu:noble

RUN apt-get update && apt-get install -y gnupg curl wget


RUN curl -fsSL https://www.mongodb.org/static/pgp/server-5.0.asc | \
   gpg -o /usr/share/keyrings/mongodb-server-5.0.gpg \
   --dearmor

RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-5.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list

RUN apt-get update && apt-get upgrade -y

## Install required Libssl version

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb && dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb && rm *.deb

RUN apt-get install -y mongodb-org=5.0.5

EXPOSE 27017

ENTRYPOINT ["/usr/bin/mongod"]
