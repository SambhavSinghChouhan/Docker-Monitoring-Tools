# Base image
FROM nginx:latest

# Set working directory
WORKDIR /etc/nginx

# Copy custom NGINX configuration
COPY default.conf /etc/nginx/conf.d/default.conf

# Optional: Copy static web files (empty folder allowed)
COPY html/ /usr/share/nginx/html/

# Expose HTTP port
EXPOSE 80

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
