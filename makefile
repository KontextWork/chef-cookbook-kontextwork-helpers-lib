prepare:
	chef exec bundle install

test: prepare
	chef exec kitchen test