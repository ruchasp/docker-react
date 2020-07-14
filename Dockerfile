#Build Phase
# Specify a base image
FROM node:alpine as builder

WORKDIR '/app'

# Install some depenendencies
COPY package.json .
RUN npm install
COPY . .

# Command
RUN npm run build

#Run Phase (using nginx)
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

