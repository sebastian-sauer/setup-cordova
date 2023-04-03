FROM runmymind/docker-android-sdk:alpine-standalone

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.16/main/ nodejs=16.20.0-r0 npm=8.10.0-r0 gradle=7.4.2-r0 && \
    npm install -g cordova

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
