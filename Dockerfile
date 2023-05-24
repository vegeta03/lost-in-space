# Use an official base image
FROM ubuntu:latest

# Install necessary tools
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    unzip \
    software-properties-common

# Install C++ compiler
RUN apt-get install -y g++

# Install SplashKit SDK
RUN curl -s https://install.sdkman.io | bash \
    && bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk install splashkit"

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Set environment variables for VS Code
ENV CC=gcc
ENV CXX=g++

# Run the command on container startup
CMD ["bash"]