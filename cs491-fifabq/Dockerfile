# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy your HTML and CSS files to the container
COPY index.html styles.css /app/
# Copy the image assets directory
COPY resources /app/resources

# Install a simple HTTP server for serving static files (optional but recommended)
RUN npm install -g http-server

# Expose the port your development server will run on
EXPOSE 8080

# Start the development server with live-reloading
CMD ["http-server", "-p", "8080"]
