
FROM debian:bullseye

RUN apt update -y

RUN apt install nodejs npm -y


COPY ./tools /home/app

WORKDIR /home/app

RUN npm init -y && npm install express -y

CMD ["node", "server.js"]
