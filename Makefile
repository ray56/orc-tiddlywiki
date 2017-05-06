.PHONY:
.ONESHELL:
SHELL := /bin/bash

include Makefile.d/*.mk



clear:
	rm docker-compose.d/docker-compose-*.yml
	rm docker-compose.d/nginx/conf.d/*.conf

docker-compose.yml: clear
	# 
	for i in sw langs itt sandbox note edu include #  
	do
		sed "s/{{wiki}}/$${i}/" docker-compose.d/nginx/conf.d/wiki.conf.tpl > docker-compose.d/nginx/conf.d/$${i}.conf
		sed "s/{{wiki}}/$${i}/" docker-compose.d/docker-compose-partial.tpl > docker-compose.d/docker-compose-$${i}.yml
	done
	cat docker-compose-main.yml docker-compose.d/docker-compose-*.yml > docker-compose.yml

htpasswd:
	rm -f  docker-compose.d/nginx/basic.htpasswd
	touch  docker-compose.d/nginx/basic.htpasswd
	for i in ryan sandboxuser xuyue chenshangtao
	do
		echo set password for $${i}
		htpasswd -d docker-compose.d/nginx/basic.htpasswd $${i}
	done


htpasswd-%:
	htpasswd -d docker-compose.d/nginx/basic.htpasswd $*

sandbox:
	sudo tiddlywiki ~/repo/noodle/bd-op/tiddlywikidata/sandbox   --server 8888 $:/core/save/all text/plain text/html "sandbox" "sandbox" 0.0.0.0
