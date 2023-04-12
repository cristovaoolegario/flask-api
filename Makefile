DIR = $(shell pwd)

activate-venv:
	source .venv/bin/activate

install-deps:
	pip install -r requirements.txt

build-image:
	docker build -t rest-apis-flask-python .

container:
	make container-stop
	docker run --name flask-api -d -p 80:80 -w /app -v "$(DIR):/app" rest-apis-flask-python

container-stop:
	docker stop flask-api || true && docker rm flask-api || true

dev-container:
	make container-stop
	docker run --name flask-api -dp 5000:5000 -w /app -v "$(DIR):/app" rest-apis-flask-python sh -c "flask run --host 0.0.0.0"

run:
	flask run --host 0.0.0.0

open:
	open http://localhost:80/swagger-ui

init-db:
	flask db init

migrate-db:
	flask db migrate

upgrade-db:
	flask db upgrade