# Use a lightweight Node.js image
FROM node:20-alpine

# Set working directory in container
WORKDIR /app

# Copy package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app files
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Default command to start your app
CMD ["node", "server.js"]
