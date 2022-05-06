build-lxc:
	git clone https://github.com/lxc/lxd
	cd lxd/lxc CGO_ENABLED=0 go build -o lxc . && cp lxc ../../
build-docker:
	sudo docker build -t tibbar/talisman:latest .
run-docker:
	docker run --rm -it -v /var/snap/lxd/common/lxd:/var/lib/lxd tibbar/talisman:latest bash
docker-push:
	docker push tibbar/talisman:latest
deploy:
	cd chart && helm install . --generate-name
