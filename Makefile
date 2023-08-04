.PHONY: all volume pull build push run

all: build run


build:
	docker build -t ghcr.io/thesystemdevelopmentkit/thesdktestimage:latest .

run: 
	docker run --device /dev/dri -it --rm \
		ghcr.io/thesystemdevelopmentkit/thesdktestimage:latest \
		echo 'Build OK'

pull: 
	docker pull  ghcr.io/thesystemdevelopmentkit/thesdktestimage:latest

push: 
	docker push ghcr.io/thesystemdevelopmentkit/thesdktestimage:latest

help:
	@echo "Available targets:"
	 @echo "    build"
	 @echo "    run"
	 @echo "    pull"
	 @echo "    push"
	 @echo "    all : build run"

