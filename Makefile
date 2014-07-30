PUB_DIR = ./public

all: css js

css:
	lessc $(PUB_DIR)/less/main.less > $(PUB_DIR)/css/main.css

js:
	handlebars ./views/ -f $(PUB_DIR)/js/templates.min.js -m
	uglifyjs $(PUB_DIR)/js/src/main.js \
	-o $(PUB_DIR)/js/scripts.min.js \
		--source-map $(PUB_DIR)/js/scripts.min.js.map \
		-c -m
