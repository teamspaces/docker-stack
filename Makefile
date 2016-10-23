setup: install clean

start:
	docker-compose up --force-recreate

install:
	git submodule update --init
	docker-compose run web bundle install
	docker-compose run web npm install
	docker-compose run web bundle exec rails db:setup
	docker-compose run web-test bundle exec rails db:setup
	docker-compose run collab npm install

clean:
	docker-compose rm -f
