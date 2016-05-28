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

#### Start

  ```bash
  docker-machine start furrow
  eval $(docker-machine env furrow)
  docker-compose up --force-recreate
  ```

#### Stop

  `make stop`

####
