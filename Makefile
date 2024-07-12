IMAGE_NAME = hidori/mydns-ipaddress-updater

.PHONY: build
build:
	docker build -f ./Dockerfile -t ${IMAGE_NAME} .

.PHONY: rebuild
rebuild:
	docker build -f ./Dockerfile -t ${IMAGE_NAME} --no-cache .

.PHONY: rmi
rmi:
	docker rmi -f ${IMAGE_NAME}

.PHONY: run
run:
	docker run -it --rm -e ID=${ID} -e PW=${PW} -e INTERVAL=5m hidori/mydns-ipaddress-updater

.PHONY: tag
tag: build
	git checkout main
	git fetch
	git pull
	docker run --rm hidori/semver -i patch ${shell cat ./version.txt} > ./version.txt
	git add ./version.txt
	git commit -m 'Updated version'
	git tag `cat ./version.txt`
	git push --tags
