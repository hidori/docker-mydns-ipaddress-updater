IMAGE_NAME = hidori/mydns-ipaddress-updater

ID ?= YOUR_ID
PW ?= YOUR_PW
INTERVAL ?= 5m

.PHONY: clean build rebuild run rmi

clean:
	rm -fr ./tmp

build:
	docker build -t ${IMAGE_NAME} .

rebuild:
	docker build --no-cache -t ${IMAGE_NAME} .

run:
	docker run --rm -e ID=${ID} -e PW=${PW} -e INTERVAL=${INTERVAL} ${IMAGE_NAME}

rmi:
	docker rmi -f ${IMAGE_NAME}
