# Placeholder Makefile
.PHONY: help deps dev-run

# Show this help
help:
	@echo "Available targets:"
	@echo "  deps             Install Node.js dependencies"
	@echo "  dev-run          Run app locally without Docker"

# Local deps
deps:
	npm ci

# Local run (no Docker)
dev-run:
	node app.js
