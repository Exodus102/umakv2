# Use a Python image as the base
FROM python:3.9-slim

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

# Set the working directory
WORKDIR /app

# Install Python dependencies from requirements.txt
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose the port for the application
EXPOSE 5000

# Start the Flask app using Gunicorn
CMD ["gunicorn", "sentiment_analysis:app"]
