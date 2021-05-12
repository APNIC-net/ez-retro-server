FROM node:14

RUN mkdir -p /app/server

WORKDIR /app/server

COPY src src/
COPY public public/
COPY config/default-0.json config/default-0.json
COPY config/default.json config/default.json
COPY config/production.json config/production.json
COPY package-lock.json .
COPY package.json .

# The production.json will overlay the default.json when NODE_ENV is set
# to "production".

RUN npm install --production

EXPOSE 3030

CMD npm start
