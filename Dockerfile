# Uporabi uradno OpenJDK 17 sliko (slim verzija, Debian-based)
FROM openjdk:21-slim

# Nastavi delovno mapo
WORKDIR /minecraft

# Namesti curl (ker wget ni v slim verziji)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Prenesi Minecraft server .jar datoteko z uporabo curl
RUN curl -o server.jar https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar

# Kopiraj konfiguracijske datoteke (poskrbi, da jih imaš v isti mapi kot Dockerfile)
COPY server.properties /minecraft/server.properties
COPY eula.txt /minecraft/eula.txt

# Odpri standardni Minecraft port
EXPOSE 25565

# Zaženi Minecraft strežnik
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
