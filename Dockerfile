# Stage 1: Build Angular App
FROM node:20 AS build


WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build --prod

# Stage 2: Serve with NGINX
FROM nginx:alpine

COPY --from=build /app/dist/testing_app/browser /usr/share/nginx/html
EXPOSE 4200

CMD ["nginx", "-g", "daemon off;"]
