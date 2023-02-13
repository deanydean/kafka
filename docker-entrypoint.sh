#!/bin/bash
# Start the Kafka server
set -o errexit -o nounset -o pipefail

if [ ! -f "${KAFKA_HOME}/kafka-cluster-id" ]
then
    echo "Generating new cluster id...."
    ${KAFKA_HOME}/bin/kafka-storage.sh random-uuid \
        > ${KAFKA_HOME}/kafka-cluster-id
fi

KAFKA_CLUSTER_ID="$(cat ${KAFKA_HOME}/kafka-cluster-id)"

${KAFKA_HOME}/bin/kafka-storage.sh format \
    -t $KAFKA_CLUSTER_ID \
    -c config/kraft/server.properties

if [ $# -ne 0 ];
then
    exec $@
fi

echo "Starting Kafka...."
${KAFKA_HOME}/bin/kafka-server-start.sh config/kraft/server.properties
