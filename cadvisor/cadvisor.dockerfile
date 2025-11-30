# --------------------------------
# 1. Base Image
# --------------------------------
FROM gcr.io/cadvisor/cadvisor:latest

# --------------------------------
# 2. Set working directory
# --------------------------------
WORKDIR /app

# --------------------------------
# 3. Copy start script
# --------------------------------
COPY start.sh /app/start.sh

# --------------------------------
# 4. Install extra tools (optional)
# --------------------------------
RUN apk update && apk add --no-cache bash nano

# --------------------------------
# 5. Expose default port
# --------------------------------
EXPOSE 8080

# --------------------------------
# 6. Entry point script
# --------------------------------
ENTRYPOINT ["/app/start.sh"]

# --------------------------------
# 7. Default command
# --------------------------------
CMD ["/usr/bin/cadvisor"]
