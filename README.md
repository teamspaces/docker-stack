# Furrow Stack
Setup a full cluster of services to get started developing in no time.
Developer happiness guaranteed. :surfer: :speedboat: :rocket: :dancing_women:

## Requirements

  * Homebrew: http://brew.sh/
  * Git (2.8+ recommended `brew install git`)

## Get started

### Install environment

  1. Install the Docker environment (https://docs.docker.com/docker-for-mac/).
  2. Run `make setup`.

### Install service dependencies

#### web
- `docker-compose run web bundle install`
- `docker-compose run web npm install`
- `docker-compose run web bundle exec rails db:setup`

#### web-test
- `docker-compose run web-test bundle exec rails db:setup`

## Usage examples

  * Start all services with `docker-compose up --force-recreate`

  * `docker-compose run collab npm install --save my-cute-package`

  * `docker-compose run web bundle install`

  * `docker-compose run web-test rails test test/controllers/welcome_controller.rb`
