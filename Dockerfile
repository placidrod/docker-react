FROM node:alpine AS builder

WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn

COPY . .
RUN yarn build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
