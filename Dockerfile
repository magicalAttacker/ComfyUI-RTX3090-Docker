
FROM nvidia/cuda:13.0.0-cudnn-devel-ubuntu24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    wget \
    curl \
    ffmpeg \
    libgl1 \
    libglib2.0-0 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone https://github.com/Comfy-Org/ComfyUI.git

WORKDIR /opt/ComfyUI

RUN python3 -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --upgrade pip setuptools wheel

# PyTorch CUDA 13.0
RUN pip install torch torchvision torchaudio \
    --index-url https://download.pytorch.org/whl/cu130

RUN pip install -r requirements.txt

# Install ComfyUI Manager
RUN git clone https://github.com/Comfy-Org/ComfyUI-Manager.git \
    custom_nodes/ComfyUI-Manager

RUN pip install -r \
    custom_nodes/ComfyUI-Manager/requirements.txt

COPY scripts/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8188

ENTRYPOINT ["/entrypoint.sh"]
