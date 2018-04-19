IMAGE_NAME = hidori/mydns-ipaddress-updater

.PHONY: build
build:
	docker build -f ./Dockerfile -t ${IMAGE_NAME}:latest .

.PHONY: rebuild
rebuild:
	docker build -f ./Dockerfile -t ${IMAGE_NAME}:latest --no-cache .

.PHONY: rmi
rmi:
	docker rmi -f ${IMAGE_NAME}

.PHONY: pull
pull: rmi
	docker pull ${IMAGE_NAME}

.PHONY: run
run:
	docker run -it --rm -e ID=${ID} -e PW=${PW} -e INTERVAL=5m hidori/mydns-ipaddress-updater
