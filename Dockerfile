FROM runmymind/docker-android-sdk:ubuntu-standalone

# Setup NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    echo "safe-perm=true" > ~/.npmrc
    
# Setup Gradle
RUN wget https://services.gradle.org/distributions/gradle-7.6.3-bin.zip -P /tmp && \
    unzip -d /opt/gradle /tmp/gradle-7.6.3-bin.zip
ENV GRADLE_HOME="/opt/gradle/gradle-7.6.3"
ENV PATH="$PATH:$GRADLE_HOME/bin"

# Setup Cordova
RUN npm i -g cordova@12.0.0

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
