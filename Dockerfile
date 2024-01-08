FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY target/documento-1.0.0.jar /app/documento-1.0.0.jar

ENV JAVA_OPTS="-Xmx256m -Xms128m"

RUN adduser -D documento
USER documento

CMD ["java", "-jar", "documento-1.0.0.jar", "--spring.profiles.active=prod", ">", "/app/app.log"]

RUN rm -rf /var/cache/apk/*


EXPOSE 8081