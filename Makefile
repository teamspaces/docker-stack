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
	@echo "- http://what.lvh.me:5510/landing"
	@echo "- http://what.lvh.me:5510/searchjoy (view searches)"
	@echo "- http://what.lvh.me:5510/sidekiq"
	@echo ""
	@echo "Usage (development):"
	@echo "- 'make assets' watch and build assets automatically"
	@echo "- 'make build_assets' build assets"
	@echo "- 'make test' run tests"
	@echo "- 'make console' attach a rails console"
	@echo "- 'make migrate' migrate database"
	@echo "- 'make bundle' bundle gems"
	@echo "- 'make yarn' bundle js packages"
	@echo "- 'make reindex' re-build search index"
	@echo ""
	@echo "Usage (environment):"
	@echo "- 'make start' spin up all containers"
	@echo "- 'make stop' stop all running containers"
	@echo "- 'make reset_database' reset database"
	@echo "- 'make build' build docker images"
	@echo "- 'make clean_build' build docker images (ignoring all cache)"
	@echo "- 'make setup_database' setup database"
	@echo "- 'make clean_setup' re-build and setup again from scratch"
	@echo "- 'make usage' see this message again"
	@echo ""
	@echo "Run 'make usage' to see this message again."
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

reindex:
	docker-compose run --rm web bundle exec rake searchkick:reindex:all

setup_database:
	docker-compose run --rm web bundle exec rails db:setup
	docker-compose run --rm web-test bundle exec rails db:setup

reset_database:
	docker-compose run --rm web bundle exec rails db:reset
	docker-compose run --rm web-test bundle exec rails db:reset

migrate:
	docker-compose run --rm web bundle exec rails db:migrate

build_assets:
	 docker-compose run --rm web ./bin/webpack --progress --colors

assets:
	docker-compose run --rm web ./bin/webpack --progress --colors --watch

console:
	docker-compose run --rm web bundle exec rails console

test:
	docker-compose run --rm web-test bundle exec rails test
