FROM node:latest as build

# WORKDIR /app

COPY . .

RUN npm install

FROM node:20.14.0-alpine

# WORKDIR /app

COPY --from=build ./node_modules ./node_modules

COPY --from=build ./public ./public

COPY --from=build ./src ./src

COPY --from=build ./package.json .

CMD [ "npm", "start" ]