FROM prom/mysqld-exporter:latest

WORKDIR /usr/bin

EXPOSE 9104

ENTRYPOINT ["/bin/mysqld_exporter"]

CMD []
