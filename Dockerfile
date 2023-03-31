FROM runmymind/docker-android-sdk:alpine-standalone

RUN echo "safe-perm=true" > ~/.npmrc && \
    npm install -g cordova

ENV JAVA_HOME "/usr/lib/jvm/java-8-openjdk"

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
