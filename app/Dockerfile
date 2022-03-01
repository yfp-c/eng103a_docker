# use node official image for this dockerfile
FROM node

# location destination inside the container
WORKDIR /usr/src/app

COPY ["package.json", "package-lock.json*", "./"]

COPY . .

# run all the commands
RUN npm install -g npm@7.20.6

RUN node seeds/seed.js

# to launch the app

EXPOSE 3000

CMD ["node", "app.js"]
# it is like node app.js or npm start 