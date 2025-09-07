APP=node-k8s-demo

# Placeholder Makefile
.PHONY: help deps dev-run docker-build docker-run docker-push

# Show this help
help:
	@echo "Available targets:"
	@echo "  deps             Install Node.js dependencies"
	@echo "  dev-run          Run app locally without Docker"
	@echo "  docker-build     Build Docker image"
	@echo "  docker-run       Run Docker image locally"
	@echo "  docker-push      Push Docker image to registry"
# Local deps
deps:
	cd app && npm ci

# Local run (no Docker)
dev-run:
	cd app && node app.js

# Build image using your host Docker
docker-build:
	docker build -t $(APP):latest .

# Run locally via Docker
docker-run:
	docker run --rm -p 3000:3000 $(APP):latest

# Push image to Docker Hub
docker-push:
	docker push $(APP):latest
