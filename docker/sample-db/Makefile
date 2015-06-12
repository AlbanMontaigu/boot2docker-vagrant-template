DOCKER_IMG_TAG = 0.1
DOCKER_IMG_NAME = sample-db

DOCKER_IMG_FULL_NAME = $(DOCKER_IMG_NAME):$(DOCKER_IMG_TAG)

DOCKER_CMD = docker

build:
	# Build that image
	$(DOCKER_CMD) build -t $(DOCKER_IMG_FULL_NAME) .

publish:
	# Publish only the final name
	$(DOCKER_CMD) push $(DOCKER_IMG_FULL_NAME)

.PONY: build publish