.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: all mongodb

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[35m%-10s\033[0m %s\n", $$1, $$2}'

all:  ## Install all Components of Application
	@sh PROJECT.sh all

debug:
	@sh -x PROJECT.sh all

mongodb:  ## Install MongoDB for Application
	@sh PROJECT.sh mongodb

rabbitmq:  ## Install RabbitMQ for Application
	@sh PROJECT.sh rabbitmq

mysql:  ## Install MySQL for Application
	@sh PROJECT.sh mysql

redis: ## Install Redis for Application
	@sh PROJECT.sh redis

catalogue:  ## Install Catalogue Application
	@sh PROJECT.sh catalogue

user:  ## Install Catalogue Application
	@sh PROJECT.sh user

cart:  ## Install Catalogue Application
	@sh PROJECT.sh cart

shipping:  ## Install Catalogue Application
	@sh PROJECT.sh shipping

web: ## Install Catalogue Application
	@sh PROJECT.sh web
