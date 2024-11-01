# Base image
ARG BASE_IMG=python:3.10-slim
FROM $BASE_IMG

ARG GRPC_HEALTH_PROBE_VERSION=""

# Requirements (use MNIST Keras as default)
ARG REQUIREMENTS=""

# Add FEDn and default configs
COPY settings-combiner.yaml /settings-combiner.yaml
COPY settings-reducer.yaml /settings-reducer.yaml

# Install developer tools (needed for psutil)
RUN apt-get update && apt-get install -y python3-dev gcc

# Install grpc health probe checker
RUN if [ ! -z "$GRPC_HEALTH_PROBE_VERSION" ]; then \
  apt-get install -y wget && \
  wget -qO/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
  chmod +x /bin/grpc_health_probe && \
  apt-get remove -y wget && apt autoremove -y; \
  else \
  echo "No grpc_health_probe version specified, skipping installation"; \
  fi

# Setup working directory
WORKDIR /

# Create FEDn app directory
SHELL ["/bin/bash", "-c"]
RUN pip3 install fedn
RUN mkdir -p /app \
  && mkdir -p /app/client \
  && mkdir -p /app/certs \
  && mkdir -p /app/client/package \
  && mkdir -p /app/certs \
