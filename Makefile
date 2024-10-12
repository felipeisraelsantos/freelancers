.PHONY: *

help:
	@printf "\033[33mComo usar:\033[0m\n  make [comando] [arg=\"valor\"...]\n\n\033[33mComandos:\033[0m\n"
	@grep -E '^[-a-zA-Z0-9_\.\/]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Sobe os containers
	./vendor/bin/sail up -d

down: ## Mata os conteiners
	./vendor/bin/sail down --remove-orphans

cr: ## executa ./vendor/bin/sail composer require, adiciona o pacote como dependência do projeto Ex: make cr package="laravel/breeze --dev"
	./vendor/bin/sail composer require $(package)

artisan: ## executa ./vendor/bin/sail artisan
	./vendor/bin/sail artisan

a-install: ## install="pacote" -> ./vendor/bin/sail artisan pacote:install
ifneq ($(install),)
	./vendor/bin/sail artisan $(install):install
endif

a-livewire: ## lv="comando" -> ./vendor/bin/sail artisan livewire:comando
ifneq ($(lv),)
	./vendor/bin/sail artisan $(lv)
endif

a-model: ## c="show User" -> ./vendor/bin/sail artisan model:show User
ifneq ($(c),)
	./vendor/bin/sail artisan model:$(c)
else
	./vendor/bin/sail artisan make:model
endif

a-migrate: ## a-migrate c=fresh -> ./vendor/bin/sail artisan migrate:fresh
	./vendor/bin/sail artisan migrate:$(c)

a-db: ## a-db c=seed -> ./vendor/bin/sail artisan db:seed
	./vendor/bin/sail artisan db:$(c)

a-mfs: ## dropa as tabelas , rodas as migrations e gera registros no banco para testes
	./vendor/bin/sail artisan migrate:fresh --seed

npm-install: ## instala dependencias do npm
	./vendor/bin/sail npm install

npmrundev: ## gera arquivos run dev1
	./vendor/bin/sail npm run dev

npmrunbuild: ## build os arquivos
	./vendor/bin/sail npm run build
