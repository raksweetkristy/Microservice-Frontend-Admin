# build stage
FROM node:18 as builder
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build
CMD ["yarn","preview"]