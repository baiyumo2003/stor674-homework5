# Start from a Python base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy your script into the container
COPY compute_bench.py .

# Install required packages
RUN pip install torch torchvision

# Run the script by default
CMD ["python", "compute_bench.py"]
