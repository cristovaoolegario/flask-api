DIR = $(shell pwd)

install-deps:
	pip install -r requirements.txt

build-image:
	docker build -t rest-apis-flask-python .

container:
	docker run --name flask-api -d -p 5000:5000 -w /app -v "$(DIR):/app" rest-apis-flask-python

container-stop:
	docker stop flask-api

run:
	flask run --host 0.0.0.0