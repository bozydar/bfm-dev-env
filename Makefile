.PHONY: tests

setup: db-drop rebuild up

up:
	docker compose up

down:
	docker compose down --remove-orphans

rebuild:
	docker compose build --no-cache

ps:
	docker compose ps

tests:
	docker compose --profile test run --rm tests

db-recreate: db-drop db-create

db-create:
	docker compose build db --no-cache

db-drop: down
	rm -Rf local/db/*
