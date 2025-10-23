# Uporabimo odprtokodno Javo 21 (alpine verzija, manjša velikost)
FROM eclipse-temurin:21-jdk-alpine

# Nastavimo delovno mapo
WORKDIR /minecraft

# Prenesemo Minecraft strežnik (verzija 1.21.1)
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/94f5f78a16dba3f22b0a54b0453e3dbf0b55a6a1/server.jar

# Sprejmemo EULA, sicer se strežnik ne zažene
RUN echo "eula=true" > eula.txt

# Odprti port za Minecraft
EXPOSE 25565

# Zaženemo strežnik z 1GB RAM-a (lahko prilagodiš)
CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "server.jar", "nogui"]
