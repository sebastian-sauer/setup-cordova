FROM runmymind/docker-android-sdk:ubuntu-standalone

# Install NodeJS
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash && \
    sudo apt install -y nodejs

# Install Gradle 7.4.2
RUN wget https://services.gradle.org/distributions/gradle-7.4.2-bin.zip -P /tmp && \
    sudo unzip -d /opt/gradle /tmp/gradle-7.4.2-bin.zip

# Install Cordova 11.1.0
RUN npm install -g cordova@11.1.0

# Set Gradle PATH
ENV GRADLE_HOME=/opt/gradle/latest/7.4.2
RUN export PATH="${GRADLE_HOME}/bin:${PATH}"

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
