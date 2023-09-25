REPO = hariso

.PHONY: build-push-kind
build-push-kind:
	TAG=`git log --oneline -n 1 --format="%h"` make docker-build

.PHONY: docker-build
docker-build:
	docker build --compress . --tag $(REPO):$(TAG)