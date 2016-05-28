STACK_NAME = furrow

setup:
	git submodule update --init

	brew update
	brew cask install dockertoolbox

	docker-machine create \
			--driver "virtualbox" \
			--virtualbox-disk-size "30000" \
			$(STACK_NAME)

	eval "$(docker-machine env $(STACK_NAME))"
	docker-compose build

stop:
	docker-machine stop $(STACK_NAME)
