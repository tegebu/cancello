FROM node:14.9.0-alpine as build-image

USER root
RUN mkdir -p /home/cancello
WORKDIR /home/cancello

COPY src src
COPY tsconfig.json tsconfig.json
COPY package.json package.json
COPY yarn.lock yarn.lock

RUN yarn install --production=false --frozen-lockfile
RUN yarn build

FROM node:14.9.0-alpine

USER root
RUN groupadd cancello
RUN useradd -g cancello cancello
RUN mkdir -p /home/cancello
WORKDIR /home/cancello

COPY --from=build-image /home/cancello/dist dist
COPY package.json package.json
COPY yarn.lock yarn.lock

RUN yarn install --production=true --frozen-lockfile
RUN yarn cache clean

RUN chown -R cancello /home/cancello
RUN chgrp -R cancello /home/cancello

USER cancello
WORKDIR /home/cancello

EXPOSE 4000

CMD ["yarn", "start"]
