# Use an official Python image as the base, with Java installed
FROM openjdk:17-slim

# Install Python and necessary build tools
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r v2/requirements.txt

# Compile the Java source files
RUN cd v2 && javac Colors.java Mine.java Multithreading.java

# Expose any necessary ports (if applicable)
# Example: EXPOSE 8000

# Start the Python server and Java client
CMD ["sh", "-c", "cd v2; java Mine"]

