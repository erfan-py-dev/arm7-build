# Dockerfile for ARM7L
FROM arm32v7/python:3.11 

# Install essential build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Install numpy separately before opencv
RUN pip install numpy

RUN pip install --no-cache-dir opencv-python

# Set working directory
WORKDIR /app

# Copy built packages to output
CMD cp -r $(python -m site --user-site)/*.whl /output
