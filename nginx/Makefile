

start:
	docker-compose up

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
