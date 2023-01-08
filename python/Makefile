IMAGE=python:3.7-buster
CONTANER=python-client

login:
	docker run -it \
		--network=$(shell cat ../docker-compose.yml | yq .networks.proxy-net.name) \
		--rm \
		${IMAGE} \
		bash

clean:
	docker stop ${CONTAINER} || true
	docker rm ${CONTAINER} || true
	docker rmi ${IMAGE} || true
