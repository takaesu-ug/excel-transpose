TAGNAME=yusabana/excel-transpose
EXCEL=

.PHONY: tasks

tasks:
	@echo Makefile
	@echo
	@echo Usage: make [task]
	@echo
	@echo Tasks:
	@ruby -ne 'puts "  #{$$1.ljust(24)}" if $$_ =~ /^([a-z\-\_]*:.*$$)/' < Makefile

docker_build:
	docker build . -t $(TAGNAME)

docker_run:
	docker run -v `pwd`:/app/excel-transpose --rm $(TAGNAME) bundle exec exe/excel-transpose $(EXCEL)

docker_tty:
	docker run -v `pwd`:/app/excel-transpose -it --rm $(TAGNAME) /bin/bash
