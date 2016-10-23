# Furrow Stack
Setup a full cluster of services to get started developing in no time.
Developer happiness guaranteed. :surfer: :speedboat: :rocket: :dancing_women:

## Requirements

  * Git (2.8+ recommended `brew install git`)
  * Docker for Mac: https://docs.docker.com/docker-for-mac/

## Get started

### Install environment

  1. Run `make setup`

## Usage examples

  * `make start` spins up the full stack for you.

  * `make clean` kills containers left from `run` commands.

  * `docker-compose run collab npm install --save my-cute-package`

  * `docker-compose run web bundle install`

  * `docker-compose run web-test rails test test/controllers/welcome_controller.rb`
