
# ComfyUI RTX3090 Docker

Docker deployment for ComfyUI with NVIDIA RTX 3090 GPU.

## Features

- NVIDIA CUDA acceleration
- PyTorch CUDA 13.0
- ComfyUI
- ComfyUI Manager
- Persistent models
- Custom nodes
- GitHub Actions CI/CD
- GHCR Docker image

## Requirements

- NVIDIA RTX 3090 or compatible GPU
- NVIDIA driver supporting CUDA 13.0
- Docker Engine
- NVIDIA Container Toolkit
- Docker Compose

## Start

```bash
docker compose pull
docker compose up -d
```

Open:

http://localhost:8188

## Logs

```bash
docker compose logs -f
```

## Stop

```bash
docker compose down
```

## Model directories

- models/
- output/
- input/
- custom_nodes/

All directories are persistent on the host.
