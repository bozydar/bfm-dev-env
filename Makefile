up:
	docker compose up -d

down:
	docker compose down

rebuild:
	docker compose build --no-cache

ps:
	docker compose ps

db-recreate: db-drop db-create
	#

db-create: rebuild
	docker compose run db /bin/bash -c "echo DONE"

db-drop: down
	rm -Rf local/db/*
