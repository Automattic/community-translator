MAKEFILE_PATH := $(dir $(lastword $(MAKEFILE_LIST)))
NODE_PATH := $(MAKEFILE_PATH)test,$(MAKEFILE_PATH):$(NODE_PATH)
REPORTER ?= spec
MOCHA ?= ./node_modules/.bin/mocha
WEBPACK = ./node_modules/.bin/webpack
DEV_FLAGS = --config webpack.dev.config.js

all: community-translator.js community-translator.min.js community-translator.css

community-translator.js:
	$(WEBPACK) $(DEV_FLAGS)

community-translator.min.js:
	$(WEBPACK)

community-translator.css: css/custom.css
	cat css/jquery.webui*.css css/custom.css > community-translator.css

test:
	@NODE_PATH=$(NODE_PATH) $(MOCHA) --reporter $(REPORTER) test/index.js

.PHONY: test
