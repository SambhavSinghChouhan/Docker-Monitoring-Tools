FROM gcr.io/cadvisor/cadvisor:latest

# Set working directory
WORKDIR /app

# No configs needed, but creating placeholder
RUN mkdir -p /config

# Expose default cAdvisor port
EXPOSE 8080

# Entry point already defined in base image
ENTRYPOINT ["/usr/bin/cadvisor"]

# No CMD override
CMD []
