![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/Nginx-009639?logo=nginx&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)

## ANP Stack (Adminer + Nginx + PostgreSQL)

## Production-ready стек из трёх сервисов, собранных из исходного кода и оркестрированных через Docker Compose.

## Стек

- **PostgreSQL** — база данных, собрана из исходников
- **Nginx** — веб-сервер и reverse proxy, собран из исходников
- **Adminer** — веб-интерфейс для управления БД, доступен через Nginx

## Архитектура

- Две изолированные сети: `frontend` и `backend`
- Postgres недоступен снаружи — только внутри сети `backend`
- Adminer проксируется через Nginx, отдельный порт закрыт
- Данные БД сохраняются в volume при перезапуске

## Быстрый старт

1. Клонируй репозиторий
2. Создай `.env` файл:

## Доступ

| Сервис   | Адрес                  |
|----------|------------------------|
| Сайт     | http://localhost       |
| Adminer  | http://localhost/adminer/ |

## Команды

| Команда        | Описание                    |
|----------------|-----------------------------|
| `make up`      | Запустить стек              |
| `make down`    | Остановить стек             |
| `make build`   | Пересобрать и запустить     |
| `make logs`    | Смотреть логи               |
| `make ps`      | Статус контейнеров          |
| `make clean`   | Остановить и удалить данные |

Используется самоподписанный SSL сертификат. В продакшене замените на сертификат от Let's Encrypt.