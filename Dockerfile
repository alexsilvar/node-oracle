FROM oraclelinux:7-slim

# Create app directory
WORKDIR /usr/src/app


# Update Oracle Linux
# Install Node.js
# Install the Oracle Instant Client
# Check that Node.js and NPM installed correctly
# Install the OracleDB driver
RUN yum update -y && \
    yum install -y oracle-release-el7 && \
    yum install -y oracle-nodejs-release-el7 && \
    yum install nodejs -y \
    yum install -y oracle-instantclient19.3-basic.x86_64 && \
    yum clean all && \
    node --version && \
    npm --version && \
    echo Installed

COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .


CMD ["npm", "start"]