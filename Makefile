help:
	@printf "\033[33mComo usar:\033[0m\n  make [comando] [arg=\"valor\"...]\n\n\033[33mComandos:\033[0m\n"
	@grep -E '^[-a-zA-Z0-9_\.\/]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Sobe os containers
	./vendor/bin/sail up -d

down: ## Mata os conteiners
	./vendor/bin/sail down --remove-orphans

composer-require: ## instalando pacotes com  compose Ex: make composer-require package="laravel/breeze --dev"
	./vendor/bin/sail composer require $(package)
