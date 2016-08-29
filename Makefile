STACK_NAME = furrow

reset: clean setup

setup:
	git submodule update --init

	brew update
	brew cask install dockertoolbox

	docker-machine create \
			--driver "virtualbox" \
			--virtualbox-disk-size "30000" \
			$(STACK_NAME)

clean:
	-docker-machine rm $(STACK_NAME)

start:
	docker-machine start $(STACK_NAME)

stop:
	docker-machine stop $(STACK_NAME)
