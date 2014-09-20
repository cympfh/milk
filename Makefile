all: run_test

run_test:
	for t in test/*.coffee;do coffee $$t;done

clean:
	rm -rf ./cc/build/
