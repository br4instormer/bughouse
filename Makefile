.DEFAULT_GOAL := up

COMPOSE_COMMAND := docker compose

restart: down up
build:
	$(COMPOSE_COMMAND) build
rebuild:
	$(COMPOSE_COMMAND) build --no-cache
up:
	$(COMPOSE_COMMAND) up -d
updb:
	$(COMPOSE_COMMAND) up -d db
createdb:
	$(COMPOSE_COMMAND) run --rm api src/scripts/createDB.js
first-run: updb createdb
down:
	$(COMPOSE_COMMAND) down --remove-orphans
down-clear:
	$(COMPOSE_COMMAND) down -v --remove-orphans
up-service:
	$(COMPOSE_COMMAND) up -d ${SERVICE}
stop-service:
	$(COMPOSE_COMMAND) stop ${SERVICE}
remove-service:
	$(COMPOSE_COMMAND) rm -f ${SERVICE}
rebuild-service:
	$(COMPOSE_COMMAND) build ${SERVICE}
renew-service: rebuild-service stop-service remove-service up-service
