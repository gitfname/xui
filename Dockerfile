FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt update && apt install -y \
    wget curl unzip socat cron bash ca-certificates \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Install 3x-ui
RUN wget -N --no-check-certificate https://raw.githubusercontent.com/MHSanaei/3x-ui/master/install.sh \
    && chmod +x install.sh \
    && ./install.sh || true

# Ensure the binary is in PATH
RUN if [ -f /usr/local/3x-ui/3x-ui ]; then \
        ln -s /usr/local/3x-ui/3x-ui /usr/bin/3x-ui; \
    fi

EXPOSE 54321 443 80

CMD ["3x-ui", "run"]
