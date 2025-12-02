# Base image
FROM httpd:latest

# Set working directory
WORKDIR /usr/local/apache2

# Copy custom Apache config
COPY httpd.conf /usr/local/apache2/conf/httpd.conf

# Copy website files (optional)
COPY html/ /usr/local/apache2/htdocs/

# Expose HTTP port
EXPOSE 80

# Healthcheck
HEALTHCHECK CMD curl --fail http://localhost/ || exit 1

# Default command
CMD ["httpd-foreground"]
