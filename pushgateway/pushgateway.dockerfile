FROM prom/pushgateway:latest

WORKDIR /bin

EXPOSE 9091


RUN echo "Pushgateway Dockerfile ready"

ENTRYPOINT ["/bin/pushgateway"]

CMD []
