DIR = $(shell pwd)

activate-venv:
	source .venv/bin/activate

install-deps:
	pip install -r requirements.txt

build-image:
	docker build -t python-api-app .

container:
	make container-stop
	docker-compose up -d

container-stop:
	docker-compose down

dev-container:
	docker run --name flask-api -dp 5000:5000 -w /app -v "$(DIR):/app" python-api-app sh -c "flask run --host 0.0.0.0"

stop-dev-container:
	docker stop flask-api || true && docker rm flask-api || true
	
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