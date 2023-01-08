
start:
	docker-compose up

check:
	export http_proxy=http://localhost:3128 \
		&& export https_proxy=http://localhost:3128 \
		&& export HTTP_PROXY=http://localhost:3128 \
		&& export HTTPS_PROXY=http://localhost:3128 \
		&& python ./helloworld/greeter_client.py \
			--url=$(shell cat ./docker-compose.yml \
			| yq .services.app.container_name):50051 \

check_internal:
	docker exec -it \
		$(shell cat ./docker-compose.yml | yq .services.app.container_name) \
		python3 ./helloworld/greeter_client.py \
			--url=localhost:50051

update:
	# If you update the protocol, you need to recompile

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
