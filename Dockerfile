# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install


# Copy the rest of the application code to the working directory
COPY . .

# Build the application using the correct build script
RUN npm run build:server

# Expose the port Medusa will run on
EXPOSE 9000

# Command to run the Medusa application
CMD [ "npx", "medusa", "start" ]
