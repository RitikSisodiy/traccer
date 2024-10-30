
# Copy the custom configuration file into the image (if you have one)

FROM alpine:3.20

ENV TRACCAR_VERSION 6.5

WORKDIR /opt/traccar


 
RUN set -ex; \
    apk add --no-cache --no-progress \
      openjdk17-jre-headless \
      wget; \
    wget -qO /tmp/traccar.zip https://github.com/traccar/traccar/releases/download/v$TRACCAR_VERSION/traccar-other-$TRACCAR_VERSION.zip; \
    unzip -qo /tmp/traccar.zip -d /opt/traccar; \
    rm /tmp/traccar.zip; \
    apk del wget

COPY ./traccar.xml /opt/traccar/conf/traccar.xml

ENTRYPOINT ["java", "-Xms1g", "-Xmx1g", "-Djava.net.preferIPv4Stack=true"]

CMD ["-jar", "tracker-server.jar", "/opt/traccar/conf/traccar.xml"]

