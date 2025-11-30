FROM prom/blackbox-exporter:latest

WORKDIR /etc/blackbox

COPY blackbox.yml /etc/blackbox/blackbox.yml

RUN mkdir -p /var/lib/blackbox

EXPOSE 9115

ENTRYPOINT ["/bin/blackbox_exporter"]
CMD ["--config.file=/etc/blackbox/blackbox.yml"]
