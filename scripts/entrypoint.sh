
#!/bin/bash
set -e

cd /opt/ComfyUI

mkdir -p /workspace/models
mkdir -p /workspace/output
mkdir -p /workspace/input
mkdir -p /workspace/custom_nodes

# Link persistent directories
for dir in models output input custom_nodes; do
    if [ ! -L "$dir" ]; then
        if [ -d "$dir" ]; then
            cp -an "$dir/." "/workspace/$dir/" || true
            rm -rf "$dir"
        fi
        ln -s "/workspace/$dir" "$dir"
    fi
done

echo "Starting ComfyUI..."
echo "GPU:"
nvidia-smi || true

exec python main.py \
    --listen 0.0.0.0 \
    --port 8188 \
    --disable-auto-launch \
    "$@"
