# Dockerfile for ARM7L
FROM arm32v7/python:3.9  # Select Python version (adjust as needed)

# Install any dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install OpenCV
RUN pip install --no-cache-dir opencv-python

# Copy built packages
CMD cp -r $(python -m site --user-site)/*.whl /output
