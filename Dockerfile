FROM maven:3.6.0-jdk-11-slim AS build
COPY pom.xml /app/
COPY src /app/src
RUN mvn -f /app/pom.xml clean package

FROM adoptopenjdk/openjdk11:alpine-jre
COPY --from=build /app/target/myproject-0.0.1-SNAPSHOT.jar /app/myproject-0.0.1-SNAPSHOT.jar
ADD ./run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 8585:8585
ENV JAVA_OPTS="-XX:+UseG1GC -XX:+UseStringDeduplication -XX:+PrintStringDeduplicationStatistics"
echo "Starting Java with the arguments $JAVA_OPTS"
CMD /run.sh
