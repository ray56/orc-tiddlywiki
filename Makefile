.PHONY:
.ONESHELL:
SHELL := /bin/bash

include Makefile.d/*.mk



clear:
	rm docker-compose.d/docker-compose-*.yml
	rm docker-compose.d/nginx/conf.d/*.conf

docker-compose.yml:
	#for i in ad android apidoc cui datadesign  datadict  design  dev  env  home  http  itt  langs  markup  matlab  note  platform  rlang  sandbox  softdeptdata  sw
	for i in sandbox cui env  home  http  itt  langs  markup   sw
	do
		sed "s/{{wiki}}/$${i}/" docker-compose.d/nginx/conf.d/wiki.conf.tpl > docker-compose.d/nginx/conf.d/$${i}.conf
		sed "s/{{wiki}}/$${i}/" docker-compose.d/docker-compose-partial.tpl > docker-compose.d/docker-compose-$${i}.yml
	done
	cat docker-compose-main.yml docker-compose.d/docker-compose-*.yml > docker-compose.yml

