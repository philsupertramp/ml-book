BUILD_DIR       =       $(shell pwd)

image:
	docker build -t latex-builder:latest .

build:image
	mkdir -p build
	docker run --rm -v ${BUILD_DIR}:/usr/app -w /usr/app latex-builder:latest src $(PROJECT_NAME)

clean:
	rm -rf build/*

