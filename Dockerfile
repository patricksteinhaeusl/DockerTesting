# Node base image with version
# node:<version>
FROM node:alpine

# Application default port
EXPOSE 3000

# APK Update
RUN apk update

# Install Git / MongoDB
RUN apk add git mongodb

# Clone git repo
WORKDIR /home/node/
RUN git clone https://github.com/patricksteinhaeusl/DockerTesting.git
WORKDIR /home/node/DockerTesting/

# Configure MongoDB
RUN mkdir -p /data/db
RUN chown mongodb:mongodb /data/db

# Start MongoDB
USER mongodb
RUN mongod &

# Start NodeJS
USER root
WORKDIR /home/node/DockerTesting/
RUN npm start