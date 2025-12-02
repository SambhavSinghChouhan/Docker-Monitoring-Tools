# Base image
FROM python:3.11

# Create a non-root user
RUN useradd -m appuser

# Set working directory
WORKDIR /app

# Copy dependencies file if exists
COPY requirements.txt /app/requirements.txt

# Install dependencies (Flask if no file)
RUN pip install --no-cache-dir -r requirements.txt || pip install flask

# Copy application files
COPY . .

# Change ownership
RUN chown -R appuser:appuser /app

# Use non-root user
USER appuser

# Expose port
EXPOSE 5000

# Healthcheck
HEALTHCHECK CMD curl --fail http://localhost:5000/ || exit 1

# Run the Flask app
CMD ["python", "app.py"]
