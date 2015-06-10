MAKEFILE_PATH := $(dir $(lastword $(MAKEFILE_LIST)))
NODE_PATH := $(MAKEFILE_PATH)test,$(MAKEFILE_PATH):$(NODE_PATH)
REPORTER ?= spec
MOCHA ?= ./node_modules/.bin/mocha
BROWSERIFY = ./node_modules/.bin/browserify
FLAGS = -t uglifyify

all: inject.js style.css

inject.js: browserify

browserify:
	$(BROWSERIFY) $(FLAGS) lib/index.js --standalone communityTranslator -o community-translator.js

style.css: css/custom.css
	cat css/jquery.webui*.css css/custom.css > community-translator.css

test:
	@NODE_PATH=$(NODE_PATH) $(MOCHA) --reporter $(REPORTER) test/index.js

.PHONY: test
