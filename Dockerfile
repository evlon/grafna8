FROM node:16.16.0 as js-builder

ENV NODE_OPTIONS=--max_old_space_size=8000

WORKDIR /usr/src/app/

COPY package.json yarn.lock ./
COPY packages packages
COPY .yarnrc.yml ./
COPY .yarn .yarn
COPY plugins-bundled plugins-bundled

RUN yarn cache clean

RUN yarn install

# Build image
# docker build --network=host -t grafana-cache:v1.0.0 -f Dockerfile.ubuntu.cache . --no-cache
