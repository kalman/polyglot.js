clean:
	@rm -rf build

build-js:
	@mkdir -p build
	@./node_modules/.bin/browserify -s Polyglot index.js -o ./build/polyglot.js
	@./node_modules/.bin/uglifyjs ./build/polyglot.js -o ./build/polyglot.min.js 
	@gzip -c ./build/polyglot.min.js > ./build/polyglot.min.js.gz

annotate:
	@./node_modules/.bin/docco ./index.js

build: clean build-js


.PHONY: clean build build-js annotate
