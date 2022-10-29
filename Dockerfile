FROM java
ADD ./target/myproject-0.0.1-SNAPSHOT.jar /myproject-0.0.1-SNAPSHOT.jar
ADD ./run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 8585:8585
ENV JAVA_OPTS="-XX:+UseG1GC -XX:+UseStringDeduplication -XX:+PrintStringDeduplicationStatistics"
echo "Starting Java with the arguments $JAVA_OPTS"
CMD /run.sh
