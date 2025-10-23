FROM eclipse-temurin:21-jdk-alpine

WORKDIR /minecraft

RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565

CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "server.jar", "nogui"]

