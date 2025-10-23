# Uporabi uradno Minecraft strežniško sliko (ali lahko uporabiš tudi openjdk za custom setup)
FROM openjdk:17-jdk-alpine

# Nastavi delovno mapo v containerju
WORKDIR /minecraft

# Prenesi zadnjo verzijo Minecraft serverja (npr. 1.20.1, spremeni po potrebi)
RUN wget -O server.jar https://launcher.mojang.com/v1/objects/f27a03d4d8f3f019d9981f2f351e295ab1a9cc05/server.jar

# Kopiraj svoje konfiguracijske datoteke v delovno mapo
COPY server.properties /minecraft/server.properties
COPY eula.txt /minecraft/eula.txt

# Odpri port 25565 (standardni Minecraft port)
EXPOSE 25565

# Zaženi Minecraft strežnik
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
