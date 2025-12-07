FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y apache2 && \
    a2dismod mpm_event && \
    a2enmod mpm_prefork

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
