FROM grafana/promtail:latest

WORKDIR /etc/promtail

# Copy config (optional)
COPY promtail-config.yml /etc/promtail/promtail-config.yml

EXPOSE 9080

ENTRYPOINT ["/usr/bin/promtail"]

CMD ["--config.file=/etc/promtail/promtail-config.yml"]
