# Izbira osnovne slike z Java 21 JDK (alpine za manjšo velikost)
FROM eclipse-temurin:21-jdk-alpine

# Nastavi delovni direktorij
WORKDIR /minecraft

# Prenesi Minecraft server JAR
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar

# Sprejmi EULA
RUN echo "eula=true" > eula.txt

# Izpostavi Minecraft port
EXPOSE 25565

# Zaženi strežnik z 1GB RAM minimalno, 2GB maksimalno in brez GUI
CMD ["java", "-Xms1G", "-Xmx2G", "-jar", "server.jar", "nogui"]
