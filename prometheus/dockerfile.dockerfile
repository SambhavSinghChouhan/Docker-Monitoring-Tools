FROM prom/prometheus:latest

WORKDIR /etc/prometheus

COPY prometheus.yml /etc/prometheus/prometheus.yml

RUN mkdir -p /prometheus-data

EXPOSE 9090

ENV PROMETHEUS_CONFIG_PATH=/etc/prometheus/prometheus.yml

ENTRYPOINT ["/bin/prometheus"]

CMD ["--config.file=/etc/prometheus/prometheus.yml"]
