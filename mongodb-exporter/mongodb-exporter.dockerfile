FROM percona/mongodb_exporter:latest

WORKDIR /etc/mongodb_exporter

EXPOSE 9216

ENTRYPOINT ["/mongodb_exporter"]

CMD ["--mongodb.uri=mongodb://mongo:27017"]
