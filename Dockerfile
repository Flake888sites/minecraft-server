FROM ubuntu:22.04
WORKDIR /app
RUN apt-get update && apt-get install -y wget curl unzip libssl-dev ca-certificates && rm -rf /var/lib/apt/lists/*
RUN wget https://launcher.mojang.com/v1/objects/8f3112a1049751cc472ec13e21ca3da27ced23c9/server-latest.zip -O server.zip && unzip server.zip && rm server.zip && chmod +x bedrock_server
COPY server.properties .
EXPOSE 19132/udp
CMD ["./bedrock_server"]
