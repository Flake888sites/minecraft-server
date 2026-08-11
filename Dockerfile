FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app/server && cd /app/server && \
    wget -q https://github.com/PMMP/PocketMine-MP/releases/download/4.23.0/PocketMine-MP.phar && \
    wget -q https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/start.sh && \
    chmod +x start.sh

COPY server.properties /app/server/

EXPOSE 19132/udp

WORKDIR /app/server

CMD ["sh", "start.sh"]
