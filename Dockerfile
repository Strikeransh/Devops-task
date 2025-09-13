# Build stage
FROM node:20-alpine AS build
WORKDIR /app
COPY ./package*.json ./
RUN npm ci
COPY . .
# no build step needed, but kept for flexibility
RUN echo "Build step skipped (static logo app)"
RUN echo "Build complete "
# Runtime stage
FROM node:20-alpine
WORKDIR /app
COPY --from=build /app ./
EXPOSE 3000
CMD ["node", "app.js"]
