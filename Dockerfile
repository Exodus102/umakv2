# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install system dependencies required for your app (e.g., Rust for tokenizers)
RUN apt-get update && apt-get install -y \
    build-essential \
    rustc \
    cargo

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for Flask
EXPOSE 5000

# Set the environment variable for Flask to run in production mode
ENV FLASK_ENV=production

# Define the command to run your app (sentiment_analysis.py)
CMD ["python", "sentiment_analysis.py"]
