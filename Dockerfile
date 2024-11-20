# Use a slim version of Python
FROM python:3.9-slim

# Install necessary build tools for compiling C extensions
RUN apt-get update && apt-get install -y build-essential libssl-dev libffi-dev python-dev

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . /app/

# Expose the required port
EXPOSE 5000

# Start the Flask app with Gunicorn
CMD ["gunicorn", "sentiment_analysis:app"]
