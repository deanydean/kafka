
FROM debian:11

RUN apt-get update && \
    apt-get install --yes curl gzip openjdk-17-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG SCALA_VERSION
ARG KAFKA_VERSION

ENV SCALA_VERSION=${SCALA_VERSION:-2.13}
ENV KAFKA_VERSION=${KAFKA_VERSION:-3.4.0}
ENV FULL_VERSION=${SCALA_VERSION}-${KAFKA_VERSION}

RUN curl "https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${FULL_VERSION}.tgz" | tar -zx

ENV KAFKA_HOME "/kafka_${FULL_VERSION}"
WORKDIR ${KAFKA_HOME}
ADD docker-entrypoint.sh /root/.
EXPOSE 9092
ENTRYPOINT [ "/root/docker-entrypoint.sh" ]
