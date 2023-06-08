FROM maven:3.8.5-eclipse-temurin-17-alpine AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests

FROM eclipse-temurin:17-jdk-alpine
COPY --from=build /target/Spring-Boot-DevOps-0.0.1-SNAPSHOT.jar spring-boot-devops.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","spring-boot-devops.jar"]