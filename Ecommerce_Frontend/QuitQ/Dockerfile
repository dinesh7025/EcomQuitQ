# Stage 1: Build the Angular app
FROM node:18 AS build

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the entire app to the container
COPY . .

# Build the Angular app for production with the correct project name
RUN npm run build -- --configuration=production --project=QuitQ

# Stage 2: Serve the app using Nginx
FROM nginx:alpine

# Copy the build output to the Nginx public directory
COPY --from=build /app/dist/quit-q /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
