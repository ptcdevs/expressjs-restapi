FROM node:18-buster-slim as base

WORKDIR /app
COPY node/package.json src/package-lock.json* ./
COPY node .

FROM base as dev
RUN npm install
ENV NODE_ENV=development
CMD ["npm", "run", "start-dev"]

FROM base as prod
RUN npm install --production
ENV NODE_ENV=production
CMD ["npm", "run", "start-prod"]
