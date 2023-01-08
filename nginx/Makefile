start:
	docker-compose up

login:
	docker run --rm -it \
		$(shell cat ./docker-compose.yml | yq .services.image) \
		bash

check:
	# use squid proxy
	# if you comment out the below lines, you cannot access nginx
	export http_proxy=http://localhost:3128 \
		&& export https_proxy=http://localhost:3128 \
		&& export HTTP_PROXY=http://localhost:3128 \
		&& export HTTPS_PROXY=http://localhost:3128 \
		&& curl http://nginx:80

clean:
	cat docker-compose.yml\
		| yq '.services."*".container_name' \
		| xargs docker stop || true
	cat docker-compose.yml\
		| yq '.services."*".container_name' \
		| xargs docker rm || true
	cat docker-compose.yml\
		| yq '.services."*".image' \
		| xargs docker rmi || true
