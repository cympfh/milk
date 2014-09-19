all: milk.node test_

milk.node:
	node-gyp configure build
	cp build/Release/milk.node .

test_:
	for t in test/*.coffee; do coffee $$t; done

clean:
	rm milk.node
	rm -rf build
