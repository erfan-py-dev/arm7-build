# Dockerfile for OpenCV ARMv7 Build

FROM python:3.11-slim as builder

# Install dependencies
RUN apt update && apt install -y \
    build-essential cmake git pkg-config \
    libjpeg-dev libpng-dev libtiff-dev \
    libavcodec-dev libavformat-dev libswscale-dev \
    libv4l-dev libxvidcore-dev libx264-dev \
    libgtk-3-dev libcanberra-gtk* \
    libatlas-base-dev gfortran \
    python3-dev python3-pip

# Upgrade pip and install required Python packages
RUN pip install --upgrade pip setuptools wheel

# Build the OpenCV wheel for ARMv7
RUN pip wheel opencv-python==4.10.0.84 -w /wheels

# Final stage: Copy the wheel to output
FROM scratch as export-stage
COPY --from=builder /wheels /output
