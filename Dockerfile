FROM node:14.4.0-slim

EXPOSE 80
WORKDIR /ui5-sdk
COPY package.json .
COPY app.js .

ENV SDK_URL https://tools.hana.ondemand.com/additional/sapui5-sdk-1.84.1.zip

RUN apt update && apt install wget unzip --yes
RUN wget --header "Cookie: eula_3_1_agreed=tools.hana.ondemand.com/developer-license-3_1.txt;" -q -O ui5.zip $SDK_URL
RUN mkdir /sap && unzip ui5.zip -d /sap/ui5 >/dev/null
RUN rm ui5.zip
RUN npm install
CMD node app.js