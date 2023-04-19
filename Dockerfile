FROM runmymind/docker-android-sdk:ubuntu-standalone

# Setup NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    echo "safe-perm=true" > ~/.npmrc
    
# Setup Gradle
RUN wget https://services.gradle.org/distributions/gradle-7.4.2-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-7.4.2-bin.zip
ENV GRADLE_HOME=/opt/gradle/gradle-7.4.2
RUN export PATH="${GRADLE_HOME}/bin:${PATH}"

# Setup Cordova
RUN npm i -g cordova@11.1.0

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
