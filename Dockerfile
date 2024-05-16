FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    openjdk-17-jre-headless \
    wget \
    screen

# Create a directory for the Minecraft server
RUN mkdir -p /minecraft
WORKDIR /minecraft

# Download the Minecraft server jar file
RUN wget -O server.jar https://launcher.mojang.com/v1/objects/your_minecraft_server_version/server.jar

# Accept the EULA
RUN echo "eula=true" > eula.txt

# Expose the Minecraft server port
EXPOSE 25565

# Start the Minecraft server
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
