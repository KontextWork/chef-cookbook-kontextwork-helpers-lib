prepare:
	chef exec bundle install

test: prepare
	chef exec kitchen converge attribute-test