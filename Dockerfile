FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

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

RUN wget -N --no-check-certificate https://raw.githubusercontent.com/MHSanaei/3x-ui/master/install.sh \
    && chmod +x install.sh \
    && ./install.sh \
    && rm install.sh

EXPOSE 54321 443 80

CMD ["3x-ui", "run"]
