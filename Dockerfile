# Build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN npm run build  # Assumes "build" script in package.json

# Production stage (Nginx serves static files)
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf  # Optional: Custom Nginx config
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
