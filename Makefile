setup: install clean

start:
	docker-compose up --force-recreate

stop:
	docker-compose down

install:
	git submodule update --init --recursive --remote
	# docker-compose up -d apt-cacher
	docker-compose run web bundle install
	docker-compose run web npm install
	docker-compose run web bundle exec rails db:setup
	docker-compose run web-test bundle exec rails db:setup
	docker-compose run collab npm install

clean:
	docker-compose rm -f
	rm -f /vendor/web/tmp/pids/server.pid
