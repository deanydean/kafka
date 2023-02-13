# Kafka KRaft for docker
A Kafka KRaft docker image

## Build image

To build the image:

```
$ make IMAGE_NAME=my_kafka_image build 
```

## Run a container using the image

To run the image:

```
$ make IMAGE_NAME=my_kafka_image run
```

The Kafka server is available in the docker image on port 9092.
