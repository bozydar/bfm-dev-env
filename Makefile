up:
	docker compose up

down:
	docker compose down

rebuild:
	docker compose build --no-cache

ps:
	docker compose ps

integration-tests:
	docker compose --profile test run --rm tests

db-recreate: db-drop db-create
	#

db-create: rebuild
	docker compose run db /bin/bash -c "echo DONE"

db-drop: down
	rm -Rf local/db/*
