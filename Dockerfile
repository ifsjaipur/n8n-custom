FROM n8nio/n8n:2.1.5

# Switch to root to install packages
USER root

# Install Python and build tools (Debian/Ubuntu style)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        ffmpeg \
        build-essential \
        python3-dev \
        libffi-dev \
        openssl \
        cargo \
        portaudio19-dev \
        pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# (Optional) create a venv and install Python libs
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir \
        numpy \
        pandas

# Make venv the default Python
ENV PATH="/opt/venv/bin:${PATH}"

# Back to node user for running n8n
USER node
