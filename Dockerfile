FROM eclipse-temurin:21-jdk-alpine
WORKDIR /minecraft
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/95495a7f485eedd84ce928cef5e223b757d2f764/server.jar
RUN echo "eula=true" > eula.txt

# Nastavi port preko ENV spremenljivke z default vrednostjo 25565
ENV MINECRAFT_PORT=25565

# Ustvari server.properties z nastavitvijo porta (lahko dodaš še druge nastavitve)
RUN echo "server-port=${MINECRAFT_PORT}" > server.properties

EXPOSE ${MINECRAFT_PORT}

CMD ["sh", "-c", "java -Xms1G -Xmx2G -jar server.jar nogui"]
