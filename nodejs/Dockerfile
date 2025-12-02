# Base image
FROM node:20

# Create a non-root user for security
RUN useradd -m appuser

# Create app folder
WORKDIR /app

# Copy package files first
COPY package.json package-lock.json* ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Change ownership to non-root user
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose application port
EXPOSE 4000

# Healthcheck
HEALTHCHECK CMD curl --fail http://localhost:4000/ || exit 1

# Start the Node.js application
CMD ["npm", "start"]
