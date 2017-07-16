setup: update_repositories build bundle yarn npm_collab setup_database build_assets usage
clean_setup: update_repositories clean_build bundle yarn npm_collab reset_database build_assets usage

start: stop
	docker-compose up --force-recreate

stop:
	docker-compose down
	docker-compose rm -f
	rm -f vendor/web/tmp/pids/server.pid

help: usage

usage:
	@echo ""
	@echo "Handy URLs for you:"
	@echo "- https://what.lvh.me:5510/landing"
	@echo ""
	@echo "Usage:"
	@echo "- 'make start' spin up all containers"
	@echo "- 'make assets' watch and build assets automatically"
	@echo "- 'make test' run tests"
	@echo "- 'make console' attach a rails console"
	@echo "- 'make reset_database' reset database"
	@echo "- 'make build' build docker images"
	@echo "- 'make clean_build' build docker images (ignoring all cache)"
	@echo "- 'make bundle' bundle gems"
	@echo "- 'make yarn' bundle js packages"
	@echo "- 'make setup_database' setup database"
	@echo "- 'make migrate' migrate database"
	@echo "- 'make build_assets' build assets"
	@echo "- 'make usage' see this message again"
	@echo ""

update_repositories:
	git submodule update --init --recursive --remote

build:
	docker-compose build

clean_build:
	docker-compose build --no-cache --pull

bundle:
	docker-compose run --rm web bundle install

yarn:
	docker-compose run --rm web yarn add --ignore-engines --force node-sass

npm_collab:
	docker-compose run --rm collab npm install

setup_database:
	docker-compose run --rm web bundle exec rails db:setup db:migrate
	docker-compose run --rm web-test bundle exec rails db:setup db:migrate

reset_database:
	docker-compose run --rm web bundle exec rails db:reset
	docker-compose run --rm web-test bundle exec rails db:reset

migrate:
	docker-compose run --rm web bundle exec rails db:migrate

build_assets:
	 docker-compose run --rm web webpack --progress --colors

assets:
	docker-compose run --rm web webpack --progress --colors --watch

console:
	docker-compose run --rm web bundle exec rails console

test:
	docker-compose run --rm web bundle exec rails test
