FROM openjdk:21-jdk

WORKDIR /minecraft

# Namesti wget
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

# Prenesi zadnjo verzijo Minecraft serverja
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar

COPY server.properties /minecraft/server.properties
COPY eula.txt /minecraft/eula.txt

EXPOSE 25565

CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
