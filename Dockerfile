# Osnovna slika z Javo
FROM eclipse-temurin:21-jdk-alpine

# Nastavi delovno mapo
WORKDIR /minecraft

# Prenesi Minecraft server .jar (posodobi link, če je treba)
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar

# Ustvari datoteko za potrditev EULA (mora biti "true")
RUN echo "eula=true" > eula.txt

# Ustvari server.properties in nastavi port 25565 (privzeti Minecraft port)
RUN echo "server-port=25565" > server.properties

# Odpri port 25565 (pomaga Dockerju in Renderu vedeti, da bo port odprt)
EXPOSE 25565

# Zaženi Minecraft server brez GUI-ja in z določenimi JVM parametri
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
