#!/bin/bash

# Pull the latest Nginx image
docker pull nginx:latest

# Run the Nginx container
docker run -d --name nginx-server -p 80:80 nginx:latest

# Optional: Cleanup logic
docker stop nginx-server || true
docker rm nginx-server || true
