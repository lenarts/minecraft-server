FROM eclipse-temurin:21-jdk-alpine

WORKDIR /minecraft

RUN wget -O server.jar https://launcher.mojang.com/v1/objects/2a1eaf7df8b60c8d02a1b226bba4e32d7ce4870b/server.jar

RUN echo "eula=true" > eula.txt

EXPOSE 25565

CMD ["java", "-Xmx1G", "-Xms1G", "-jar", "server.jar", "nogui"]
