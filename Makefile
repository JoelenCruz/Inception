INTRA_LOGIN := jcruz-da
DOMAIN_NAME := $(INTRA_LOGIN).42.fr
DATA_PATH := /home/$(INTRA_LOGIN)/data

all: set_host
	@ sudo mkdir -p $(DATA_PATH)/mysql
	@ docker volume create --name mariadb_volume --opt type=none --opt device=$(DATA_PATH)/mysql --opt o=bind
	@ sudo mkdir -p $(DATA_PATH)/wordpress
	@ docker volume create --name wordpress_volume --opt type=none --opt device=$(DATA_PATH)/wordpress --opt o=bind
	@ docker-compose -f ./srcs/docker-compose.yml up -d --build

set_host:
	@ sudo grep -q $(DOMAIN_NAME) /etc/hosts || sudo sed -i "3i127.0.0.1\t$(DOMAIN_NAME)" /etc/hosts

up:
	@ sudo docker-compose -f ./srcs/docker-compose.yml up --build --detach

down:
	@ sudo docker-compose -f ./srcs/docker-compose.yml down

fclean: down
	@ docker system prune --all --force --volumes
	@ docker volume rm mariadb_volume wordpress_volume
	@ sudo rm -fr $(DATA_PATH)

.PHONY: all set_host up down fclean
