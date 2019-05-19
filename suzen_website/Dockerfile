# ==== Node.js ====
FROM node:11-alpine as node
# Install dependencies for imagemin
RUN apk add --no-cache \
    autoconf \
    automake \
    bash \
    g++ \
    libc6-compat \
    libjpeg-turbo-dev \
    libpng-dev \
    make \
    nasm
# Copy sources
COPY . .
# Build assets
RUN yarn && yarn build

FROM nginx:alpine

COPY --from=node dist /usr/share/nginx/html