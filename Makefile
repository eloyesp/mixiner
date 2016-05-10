test:
	cutest -r ./lib/mixiner.rb test/*

doc: README.md lib/*
	mkdir -p doc
	yard doc
	touch doc

.PHONY : test
