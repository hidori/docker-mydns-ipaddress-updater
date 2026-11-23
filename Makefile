IMAGE_NAME = hidori/mydns-ipaddress-updater

.PHONY: clean build rebuild rmi run

clean:
	rm -fr ./tmp

build:
	docker build -f ./Dockerfile -t ${IMAGE_NAME} .

rebuild:
	docker build -f ./Dockerfile -t ${IMAGE_NAME} --no-cache .

rmi:
	docker rmi -f ${IMAGE_NAME}

run:
	docker run -it --rm -e ID=${ID} -e PW=${PW} -e INTERVAL=5m ${IMAGE_NAME}
