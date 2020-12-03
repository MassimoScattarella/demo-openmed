FROM node:lts-alpine

RUN npm install -g npm

WORKDIR /usr/src/app

COPY ./app/package.json ./
RUN npm install
COPY ./app .

EXPOSE 3000

CMD [ "npm", "start" ]