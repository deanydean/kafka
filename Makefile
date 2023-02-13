
IMAGE_NAME ?= deanydean/kafka
IMAGE_TAG ?= latest

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

run:
	docker run --rm -it $(IMAGE_NAME):$(IMAGE_TAG)

push: build
	docker push $(IMAGE_NAME):$(IMAGE_TAG)
 