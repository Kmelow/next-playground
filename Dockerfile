FROM node:12.18.4-alpine as base
EXPOSE 3000
WORKDIR /opt
COPY package*.json ./
RUN npm config list \
    && npm ci \
    && npm cache clean --force
COPY . .
RUN npm run build
CMD [ "npm", "start" ]