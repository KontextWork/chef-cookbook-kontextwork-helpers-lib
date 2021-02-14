prepare:
	rm -fr cookbooks
	chef exec berks install
	chef exec berks update
	chef exec berks vendor cookbooks

test: prepare
	chef exec kitchen destroy