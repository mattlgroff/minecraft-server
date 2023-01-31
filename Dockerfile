# Debian linux
FROM debian:bullseye-slim

# update apt and install jdk
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes --no-install-recommends \
      openjdk-17-jre-headless

# Create minecraft working directory
WORKDIR /minecraft

# Download minecraft server .jar
ADD https://piston-data.mojang.com/v1/objects/c9df48efed58511cdd0213c56b9013a7b5c9ac1f/server.jar server.jar

# Copy Minecraft EULA
COPY eula.txt eula.txt

# Copy Minecraft server properties
COPY server.properties server.properties

# Open default Minecraft server port
EXPOSE 25565

# Run Minecraft server
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]