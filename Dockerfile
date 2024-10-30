# Dockerfile
FROM traccar/traccar:latest
# Set up the hostname
ENV HOSTNAME=traccar
# Set the environment variables if needed
ENV TRACCAR_LOGS=/opt/traccar/logs
ENV TRACCAR_CONF=/opt/traccar/conf/traccar.xml

# Copy the custom configuration file into the image (if you have one)
COPY traccar.xml $TRACCAR_CONF

# Create necessary directories (if they don't exist)
RUN mkdir -p $TRACCAR_LOGS
# Set container to restart unless stopped
LABEL restart_policy="unless-stopped"
# Expose ports
EXPOSE 8082
EXPOSE 5000-5150
EXPOSE 5000-5150/udp


