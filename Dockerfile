FROM node:alpine

MAINTAINER Manala <contact@manala.io>

RUN \
  apk add --no-cache make \
  && npm --global install \
    eslint \
    eslint-plugin-react \
    eslint-plugin-react-native \
  && rm -rf /root/.npm

# Switch node user to lint
RUN sed -i -e s/node:/lint:/ /etc/passwd /etc/group && \
    mv /home/node /home/lint

USER lint
WORKDIR /home/lint
