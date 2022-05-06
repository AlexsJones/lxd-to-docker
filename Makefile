build-lxc:
	git clone https://github.com/lxc/lxd
	cd lxd/lxc CGO_ENABLED=0 go build -o lxc . && cp lxc ../../
build-docker:
	sudo docker build -t talisman .
run-docker:
	docker run --rm -it -v /var/snap/lxd/common/lxd:/var/lib/lxd talisman:latest bash
