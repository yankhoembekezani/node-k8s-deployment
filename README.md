# Node-K8-Deployment

## Project Overview

Node-K8-Deployment is a lightweight, modular Node.js application designed to be container-ready and deployable on Kubernetes. It provides a simple service with a health check endpoint, making it suitable for demonstration, testing, and incremental deployment workflows.

The project emphasizes **structured reproducibility**, **clean code**, and **progressive deployment**, enabling seamless integration with containerization and orchestration pipelines.

## Features

- REST endpoint at `/` returning a basic greeting.
- Health check endpoint at `/healthz` for monitoring.
- Local test outputs captured in `docs/test.txt` for verification.
- Makefile automation for dependency installation and local run.

## Roadmap

- Containerize the Node.js application with Docker.
- Prepare Kubernetes manifests for deployment (`k8s/deployment.yaml`, `k8s/service.yaml`).
- Integrate CI/CD workflows for automated testing and deployment.
- Expand monitoring and observability features.

## Project Structure.

```text
node-k8s-deployment/
├── app/                   	# Node.js application source code
│   ├── app.js              	# main entry point
│   ├── package.json        	# project metadata and dependencies
│   └── package-lock.json   	# locked dependency versions
├── docs/                       # captured outputs from running the app
│   └── app-output.txt
├── .gitignore              	# ignored files for Git
├── Makefile                	# dev/run/build commands
├── .pre-commit-config.yaml 	# pre-commit hooks configuration
└── README.md              	# project overview and instructions
```

## Setup & Installation

### Prerequisites

- Node.js (v20 or later)
- Make (to run project commands)

### Clone the repository

```bash
git clone https://github.com/yankhoembekezani/node-k8s-deployment.git
cd node-k8s-deployment
```

### Install dependencies

From the project root:

```bash
make deps
```

This runs `npm ci` inside the `app/` folder to install dependencies in a reproducible way.

## Usage

### Run the application

```bash
make dev-run
```

This runs the Node.js app from `app/app.js`.

Alternatively, run directly:

```bash
cd app
node app.js
```

## Verify Output

- Appliction Endpoint

```bash
curl localhost:3000/
```

- Health Endpoint
  ```bash
  curl localhost:3000/healthz
  ```

## License

This project is licensed under the [MIT License](LICENSE).
