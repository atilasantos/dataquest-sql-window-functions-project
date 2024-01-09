# -----------------------------------------------------------------------------
# Makefile to initialize a postgresql instance using docker-compose
# Version: 1.0.0
# Date: 2023-12-28
# -----------------------------------------------------------------------------

# VARIABLES

# Use bash shell
SHELL := /usr/bin/env bash

# Root directory
ROOT := ${CURDIR}

# FUNCTIONS

# To execute script with error handling
define run_compose
    @docker compose --file docker-compose.yaml --env-file .env $(1) || { echo "Error executing script: $(1)"; exit 1; }
endef

.DEFAULT_GOAL := help

# Help target to display available commands
.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY: volume-create
volume-create: ## Target specified to create required volumes to run postgresql
	@docker volume create postgres_data

.PHONY: volume-delete
volume-delete: ## Target specified to create required volumes to run postgresql
	@docker volume rm postgres_data

# compose up the services within docker-compose file
.PHONY: postgres-up
postgres-up: ## run postgres instance locally as configured in docker-compose.yaml file
	$(call run_compose,up -d)

# compose down the services within docker-compose file
.PHONY: postgres-down
postgres-down: ## stops postgres instance running locally
	$(call run_compose,down)
