FROM debian:bullseye-slim

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt update && apt install -y \
    wget \
    curl \
    unzip \
    socat \
    cron \
    bash \
    ca-certificates \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Download and install 3x-ui
RUN wget -N --no-check-certificate https://raw.githubusercontent.com/MHSanaei/3x-ui/master/install.sh \
    && chmod +x install.sh \
    && ./install.sh \
    && rm install.sh

# Expose necessary ports
EXPOSE 54321 443 80

# Run 3x-ui panel
CMD ["3x-ui", "run"]
