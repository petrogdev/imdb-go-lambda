# Makefile
#

help:
	@echo "Usage: {options} make [target ...]"
	@echo
	@echo "Commands:"	
	@echo "  install         Install required dependencies"
	@echo "	 run			 Run the application"
	@echo "  update          Update required dependencies"
	@echo "  lint            Run gometalinter linting"
	@echo "  clean           Clean up your project."
	@echo
	@echo "  help            Show available commands"
	@echo
	@echo "Examples:"
	@echo "  # Getting started"
	@echo "  make install"
	@echo "  make lint test"
	@echo

install:
	@ echo "Download required dependencies"
	@ dep ensure
	@ echo "Finished downloading required dependencies"

update:
	@ echo "Update required dependencies"
	@ dep ensure -update
	@ echo "Finished updating required dependencies"

lint:
	@ echo "Start linting"
	@ gometalinter ./... --vendor
	@ echo "Finished linting"

build-linux:
	@ echo "building binary for linux"
	@ GOOS=linux go build -o main main.go
	@ echo "Finished"

test:
	@ echo "Test all"
	@ go test
	@ echo "Finished testing"

clean:
	@ echo "Deleting dependency folder"
	@ rm -fr ./vendor
	@ echo "Finished deleting dependency folder"

test-sec:
	@ echo "Running security checks"
	@ gosec ./...
	@ echo "Finished security checks"
