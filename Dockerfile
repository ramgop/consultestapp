FROM maven as MAVEN_BUILDER
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM openjdk:8-jdk-alpine
VOLUME /tmp
EXPOSE 8080
COPY --from=MAVEN_BUILDER /tmp/target/consultestapp*.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar  --spring.config.location=classpath:application.properties,classpath:application.yml,/tmp/
