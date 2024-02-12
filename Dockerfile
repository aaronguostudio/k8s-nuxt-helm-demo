# ------ Build Stage ------
FROM node:20.9.0 AS build
WORKDIR /app

ARG PORT=8080
ENV PORT=$PORT

COPY . .

RUN yarn install
RUN yarn build

EXPOSE 8080

CMD ["npm", "start"]
