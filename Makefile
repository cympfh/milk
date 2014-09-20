all:
	cd cc; make
	cd coffee; make
	cd test; make

clean:
	rm -rf ./cc/build/
