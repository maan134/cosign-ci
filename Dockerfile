# Stage 1: Build the application
FROM node:slim AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Production image
FROM node:slim
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 8080
CMD ["npm", "start"]