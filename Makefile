
start:
	docker network create proxy-net || true
	docker-compose up

login:
	docker exec -it \
		$(shell cat ./docker-compose.yml \
			| yq .services.squid.container_name) \
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
	cd grcp && make clean
	cd milvus && make clean
	cd nginx && make clean
	cd python&& make clean
