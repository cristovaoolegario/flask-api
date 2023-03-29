build-image:
	docker build -t rest-apis-flask-python .

container:
	docker run -d -p 5000:5000 rest-apis-flask-python