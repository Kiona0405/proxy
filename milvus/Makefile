start:
	docker-compose up

check:
	export http_proxy=http://localhost:3128 \
		&& export https_proxy=http://localhost:3128 \
		&& export HTTP_PROXY=http://localhost:3128 \
		&& export HTTPS_PROXY=http://localhost:3128 \
		&& export grpc_proxy=http://localhost:3128 \
		&& ./access_check.py
	# This program not work
	# The reason is the squid proxy server doesn't support grpc protocol

login:
	docker exec -it \
		$(shell cat docker-compose.yml \
			| yq .services.standalone.container_name) \
		bash

clean:
	docker network rm proxy-net || true
	cat docker-compose.yml\
		| yq '.services."*".container_name' \
		| xargs docker stop || true
	cat docker-compose.yml\
		| yq '.services."*".container_name' \
		| xargs docker rm || true
	cat docker-compose.yml\
		| yq '.services."*".image' \
		| xargs docker rmi || true
	rm -rf ./volumes
