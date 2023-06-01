FROM node:18-buster-slim as base

WORKDIR /app
COPY src/package.json src/package-lock.json* ./
COPY ./src .

FROM base as dev
RUN npm install
ENV NODE_ENV=development
CMD ["node", "./index.js"]

FROM base as prod
RUN npm install --production
ENV NODE_ENV=production
CMD ["node", "./index.js"]