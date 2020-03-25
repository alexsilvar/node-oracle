FROM store/oracle/database-instantclient:12.2.0.1 AS client

# ADD ol7_developer_nodejs8.repo /etc/yum.repos.d/ol7_developer_nodejs8.repo

FROM node:12.2.0-alpine
# ENV NODE_ENV production
# ENV NODE_ORACLEDB_USER user
# ENV NODE_ORACLEDB_PASSWORD asdjkalsdjkl
# ENV NODE_ORACLEDB_CONNECTIONSTRING localhost/blabla

WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3000
CMD npm start