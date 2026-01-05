# Custom n8n 2.1.5 image with Python and audio libs
# Base image is Alpine-based n8nio/n8n

FROM n8nio/n8n:2.1.5

# Switch to root to install packages
USER root

# Install Python and build tools
RUN apk add --no-cache \
    python3 \
    py3-pip \
    ffmpeg \
    build-base \
    python3-dev \
    libffi-dev \
    openssl-dev \
    cargo \
    portaudio-dev \
    musl-dev \
    g++ \
    pkgconfig

# Ensure pip is up to date and create a virtualenv
RUN python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    python3 -m venv /opt/venv

# Add venv to PATH so "python3" and "pip" use it
ENV PATH="/opt/venv/bin:$PATH"

# Install Python packages you need
# (example: librosa stack; adjust as needed)
RUN pip install --no-cache-dir \
    librosa \
    numpy \
    scikit-learn \
    soundfile \
    audioread

# Switch back to node user for running n8n
USER node
