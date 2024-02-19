# build stage
FROM node:16.20.2-alpine as builder
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build
CMD ["yarn","preview"]