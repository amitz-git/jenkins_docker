# Use the latest Nginx image
FROM nginx:latest

# Copy custom configuration if needed
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the default Nginx port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
