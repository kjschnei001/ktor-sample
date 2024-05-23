FROM eclipse-temurin:17
ADD build/distributions/com.example.ktor-sample-0.0.1.tar /

ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar /app/otel.jar
RUN chmod 444 /app/otel.jar

USER 65538
EXPOSE 8080

ENV JAVA_TOOL_OPTIONS=-javaagent:/app/otel.jar
ENTRYPOINT ["com.example.ktor-sample-0.0.1/bin/com.example.ktor-sample"]