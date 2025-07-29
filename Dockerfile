FROM ubuntu:bionic

RUN apt-get update && apt-get install -y \
	curl \
	gnupg \
	wget && \
	rm -rf /var/lib/apt/lists/*

# Add MongoDB 7.0 GPG key
RUN wget -qO - https://pgp.mongodb.com/server-7.0.asc | apt-key add -

# Add MongoDB 7.0 repository for Ubuntu bionic
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list

RUN apt-get update && apt-get upgrade -y

# Install MongoDB 7.0
RUN apt-get install -y \
    'mongodb-org=7.0*' \
    'mongodb-org-mongos=7.0*' \
    'mongodb-org-server=7.0*' \
    'mongodb-org-shell=7.0*' \
    'mongodb-org-tools=7.0*'

RUN mkdir -p /data/db && \
    ln -s /usr/bin/mongosh /usr/bin/mongo

EXPOSE 27017

ENTRYPOINT ["/usr/bin/mongod"]
