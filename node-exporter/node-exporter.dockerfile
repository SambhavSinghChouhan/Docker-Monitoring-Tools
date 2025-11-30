FROM prom/node-exporter:latest

# Working directory
WORKDIR /bin

# Expose Node Exporter port
EXPOSE 9100

# COPY command (optional, if configs needed)
# COPY config.yml /etc/node_exporter/config.yml

# Node Exporter entrypoint
ENTRYPOINT ["/bin/node_exporter"]

# Default CMD
CMD []
