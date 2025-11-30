FROM grafana/grafana:latest

WORKDIR /etc/grafana

COPY grafana.ini /etc/grafana/grafana.ini

RUN mkdir -p /var/lib/grafana

EXPOSE 3000

ENV GF_PATHS_CONFIG=/etc/grafana/grafana.ini
ENV GF_PATHS_DATA=/var/lib/grafana

ENTRYPOINT ["/run.sh"]

CMD []
