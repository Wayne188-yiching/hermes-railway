FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install hermes-agent
RUN pip install --no-cache-dir hermes-agent

# Create hermes config directory
RUN mkdir -p /root/.hermes

# Copy config template
COPY config.yaml /root/.hermes/config.yaml

# Copy and set up entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
