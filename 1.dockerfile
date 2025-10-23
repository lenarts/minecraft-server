FROM openjdk:21
WORKDIR /app
COPY . .
RUN curl -o server.jar https://piston-data.mojang.com/v1/objects/94f5f78a16dba3f22b0a54b0453e3dbf0b55a6a1/server.jar
RUN echo "eula=true" > eula.txt
EXPOSE 25565 8080
CMD java -Xmx10G -Xms10G -jar server.jar nogui