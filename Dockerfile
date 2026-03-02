# Use Node.js LTS image
FROM node:20-alpine

# Set environment variables (example)
ENV MONGO_DB_USERNAME=admin
ENV MONGO_DB_PWD=password

# Create app directory
RUN mkdir -p /home/app

# Copy app files
COPY ./app /home/app

# Set working directory
WORKDIR /home/app

# Install dependencies
RUN npm install

# Start the app
CMD ["node", "server.js"]
