FROM node:20.10.0-alpine AS build

RUN apk update
RUN apk add python3 make cmake libusb g++ py3-pip linux-headers libudev-zero
RUN corepack enable && yarn set version 4.5.0

WORKDIR /app
COPY . .

RUN yarn
RUN yarn build

FROM nginx:alpine3.19 as runtime

COPY --from=build /app/apps/main/out /usr/share/nginx/html