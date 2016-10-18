# Furrow Stack
Making the lives easier for everyone. Developer happiness guaranteed.

## Requirements

  * Homebrew: http://brew.sh/
  * Git (2.8+ recommended `brew install git`)

## Get started

### Install environment

  Install the Docker environment, setup our virtual machine and build our
  containers.

  `make setup`

### Usage

### Configure services

#### API
- `docker-compose run api bundle install`
- `docker-compose run api npm install`
- `docker-compose run api bundle exec rake db:setup`

#### API-test
- `docker-compose run api-test bundle exec rake db:setup`

#### Collab
- `docker-compose run collab npm install`

#### Start

  ```bash
  docker-machine start furrow
  eval $(docker-machine env furrow)
  docker-compose up --force-recreate
  ```

#### Stop

  `make stop`

####
