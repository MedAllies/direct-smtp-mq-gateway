FROM azul/zulu-openjdk-alpine:8u282-jre

# Run system update
RUN apk update
RUN apk upgrade --ignore zulu8-*
RUN apk add --no-cache --upgrade bash
RUN apk add --no-cache curl expect busybox-extras && \
    rm -rf /var/cache/apk/*

# When building images, use this tag
LABEL tag=smtp-mq-gateway

# Build arguments
ARG BUILD_VERSION=8.1.0-SNAPSHOT

# Create and use local user and group
RUN addgroup -S direct && adduser -S -D direct -G direct

# Set application location
RUN mkdir -p /opt/app
RUN chown direct:direct /opt/app
ENV PROJECT_HOME /opt/app

ENV CLOUD_CONFIG=true

# Set RabbitMQ properties
ENV RABBIT_MQ_HOST=rabbitmq
ENV RABBIT_MQ_PORT=5672
ENV RABBIT_MQ_USERNAME=guest
ENV RABBIT_MQ_PASSWORD=guest
ENV SMTP_MQ_GATEWAY_PORT=25

# Use local user and group
USER direct:direct

# Copy application artifact
COPY bootstrap.properties $PROJECT_HOME/bootstrap.properties
COPY application.properties $PROJECT_HOME/application.properties
COPY target/direct-smtp-mq-gateway-$BUILD_VERSION.jar $PROJECT_HOME/smtp-mq-gateway.jar

# Switching to the application location
WORKDIR $PROJECT_HOME

# Run application
CMD ["java","-jar","./smtp-mq-gateway.jar"]
