SHELL=/bin/sh

# createproject:
# 	docker-compose run app django-admin.py startproject project .

# createapp:
# 	docker-compose exec app python manage.py startapp app

up:
	-docker-compose up
u:
	-docker-compose up -d

buildup:
	docker-compose down --volumes --remove-orphans
	docker-compose up -d --build
	docker-compose exec web sleep 5
	docker-compose exec app python manage.py check
	docker-compose exec app python manage.py makemigrations
	docker-compose exec app python manage.py migrate
	-docker-compose logs -f

build:
	docker-compose build

start:
	-docker-compose start

stop:
	-docker-compose stop

d: down

down:
	-docker-compose down

ps:
	docker-compose ps

logs:
	-docker-compose logs -f

app:
	docker-compose exec app bash

web:
	docker-compose exec web bash

db:
	docker-compose exec db bash
