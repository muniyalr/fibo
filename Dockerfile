FROM node:12

# Create app directory
WORKDIR /home/nirvis/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json /home/nirvis/app/
COPY src /home/nirvis/app/src/
COPY test /home/nirvis/app/test/

RUN npm install

RUN ls && pwd
RUN npm test
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "index.js" ]
