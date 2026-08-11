FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    libssl-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -o server.zip https://github.com/pmmp/PocketMine-MP/releases/download/4.20.3/PocketMine-MP.phar && \
    unzip -o server.zip && \
    rm server.zip || true

COPY server.properties .

EXPOSE 19132/udp

CMD ["php", "PocketMine-MP.phar"]
