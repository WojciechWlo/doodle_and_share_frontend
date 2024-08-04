# Base stage: Install dependencies
FROM node:14-alpine AS base

WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Development stage: Set up for development
FROM base AS development

# Copy the rest of the application code
COPY . .

# Expose the development server port
EXPOSE 3000

# Start the development server
CMD ["npm", "start"]

# Production stage: Build the application
FROM base AS build

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Production stage: Serve the application with Nginx
FROM nginx:alpine AS production

# Copy the build output to the Nginx HTML directory
COPY --from=build /app/build /usr/share/nginx/html

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]