# Node base image with version
# node:<version>
FROM node:alpine

# Application default port
EXPOSE 3000
EXPOSE 27017

# APK Update
RUN apk update

# Install Git / MongoDB
RUN apk add git

# Clone git repo
WORKDIR /home/node/
RUN git clone https://github.com/patricksteinhaeusl/DockerTesting.git
WORKDIR /home/node/DockerTesting/

RUN npm start