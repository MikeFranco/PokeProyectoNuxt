FROM node:11-alpine
ENV HOST 0.0.0.0
EXPOSE 3000
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN yarn install
COPY . /app
RUN yarn build
CMD [ "yarn", "start" ]