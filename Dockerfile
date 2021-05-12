# https://github.com/nekolr/maven-image/tree/master/3.6.1-jdk-8
FROM nekolr/maven:3.6.1 AS build

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . .

RUN mvn clean package

FROM openjdk:8-jdk-alpine

COPY --from=build /usr/src/app/slime-web/target/slime.jar .

EXPOSE 8086

CMD java -jar slime.jar