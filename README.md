# direct-smtp-mq-gateway

Lightweight SMTP Server Gateway Standalone Spring Boot Micro-service Application 

## Build Component
This project is using maven pom.xml file for the build lifecyle.

`mvn clean install`

## Running Component
To run this project locally with default configuration:

`java -jar direct-smtp-mq-gateway-<version>.jar`

For a custom configuration please use externalized `application.properties` along with the JAR file.

## Microservice health check

`smtp-mq-gateway` can be verified by using telnet on the host and port

`telnet <host> <port>`

## Microservice containerization

Microservice application should be built and ready to deploy using `mvn clean isntall` command or full package built form `direct-ri-build-microsrvcs` project.

To create docker image or `smtp-mq-gateway` run command below:

`docker build -t smtp-mq-gateway:latest .`

When running created image containerized microservice will start on default port `25` with default RabbitMQ `guest` user and `guest` password.

## Dependencies

Need RabbitMQ instance running with specified connection to it in the `Dockerfile`