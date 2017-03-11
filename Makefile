setup: install clean

start:
	rm -f vendor/web/tmp/pids/server.pid
	docker-compose up --force-recreate

stop:
	docker-compose down

install:
	git submodule update --init --recursive --remote
	docker-compose run --rm web bundle install
	docker-compose run --rm web yarn install
	docker-compose run --rm web bundle exec rails db:setup
	docker-compose run --rm web webpack --progress --colors
	docker-compose run --rm web-test bundle exec rails db:setup
	docker-compose run --rm collab npm install

clean:
	docker-compose rm -f
	rm -f /vendor/web/tmp/pids/server.pid
