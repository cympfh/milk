all: gyp test

gyp:
	cd cc; make
	cd coffee; make

test:
	cd tests; make

clean:
	rm -rf ./cc/build/
