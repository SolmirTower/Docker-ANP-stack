.PHONY: up down restart logs build ps

up:
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart

logs:
	docker compose logs -f

build:
	docker compose up -d --build

ps:
	docker compose ps

clean:
	docker compose down -v
