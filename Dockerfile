# Use the latest Traccar image as the base
FROM traccar/traccar:latest

# Set the container's hostname
ENV HOSTNAME=traccar

# Copy configuration files
COPY ./logs /opt/traccar/logs
COPY ./traccar.xml /opt/traccar/conf/traccar.xml

# Expose the necessary ports
EXPOSE 8082
EXPOSE 5000-5150/udp

