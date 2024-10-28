# Start from the latest Traccar image
FROM traccar/traccar:latest

# Set up the hostname
ENV HOSTNAME=traccar

# Expose the necessary ports
EXPOSE 8082

# Copy necessary configuration and log files
# Assuming the traccar.xml configuration file and logs folder are located at /opt/traccar on your host
COPY ./traccar.xml ./conf/traccar.xml
VOLUME ./logs

# Define the entry point
ENTRYPOINT ["./traccar"]

# Set container to restart unless stopped
LABEL restart_policy="unless-stopped"
