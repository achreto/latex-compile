
USERNAME=achreto
IMAGE=latex-compile
DOCKERHUB_URL=$(USERNAME)/$(IMAGE)


build: Dockerfile
	docker build -t $(IMAGE) .

tag:
	docker tag $(IMAGE) $(DOCKERHUB_URL)

publish: build
	docker tag $(IMAGE) $(DOCKERHUB_URL)
	docker push $(DOCKERHUB_URL)

login:
	docker login $(USERNAME)
