.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: help pull all debug mongodb rabbitmq mysql redis nodejs cart user shipping web

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[35m%-10s\033[0m %s\n", $$1, $$2}'
pull:
	@git pull &>/dev/nul

all: pull ## Install all Components of Application
	@sh PROJECT.sh all

debug:
	@sh -x PROJECT.sh all

mongodb: pull ## Install MongoDB for Application
	@sh PROJECT.sh mongodb

rabbitmq: pull ## Install RabbitMQ for Application
	@sh PROJECT.sh rabbitmq

mysql: pull ## Install MySQL for Application
	@sh PROJECT.sh mysql

redis: pull ## Install Redis for Application
	@sh PROJECT.sh redis

nodejs: pull ## Install Nodejs for Application
	@sh PROJECT.sh nodejs

catalogue: pull ## Install Catalogue Application
	@sh PROJECT.sh catalogue

user: pull ## Install Catalogue Application
	@sh PROJECT.sh user

cart: pull ## Install Catalogue Application
	@sh PROJECT.sh cart

shipping: pull ## Install Catalogue Application
	@sh PROJECT.sh shipping

web: pull ## Install Catalogue Application
	@sh PROJECT.sh web

payment: pull ## Install Payment Application
	@sh PROJECT.sh payment

dispatch: pull ## Install Dispatch Application
	@sh PROJECT.sh dispatch

rating: pull ## Install Rating Application
	@sh PROJECT.sh rating
