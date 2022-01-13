init: down
	docker-compose up -d

exec:
	docker-compose exec bootstrap.node bash

down:
	docker-compose down

.PHONY: build
build:
	docker-compose build