init: down
	docker-compose up -d

exec:
	docker-compose exec bootstrap.node bash

down:
	docker-compose down

watch:
	docker-compose exec bootstrap.node npm run watch-css-docs

serve:
	docker-compose exec bootstrap.node hugo server --port 9001 --disableFastRender

.PHONY: build
build:
	docker-compose build