FROM node:latest as build

LABEL author.name="Aniket Pandey"

WORKDIR /survey-ui/app

RUN npm install -g @angular/cli

COPY ./survey-ui/package.json .

RUN npm install

COPY ./survey-ui .

RUN ng build

FROM nginx as runtime

COPY --from=build /survey-ui/app/dist/survey-ui /usr/share/nginx/html