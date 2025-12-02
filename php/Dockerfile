# Base
FROM php:8-apache

# Enable Apache modules
RUN a2enmod rewrite && a2enmod headers

# Set working dir
WORKDIR /var/www/html

# Copy source code
COPY . .

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port
EXPOSE 80

# Healthcheck
HEALTHCHECK CMD curl --fail http://localhost/ || exit 1

# Start Apache
CMD ["apache2-foreground"]
