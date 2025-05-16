#!/bin/bash


# Build the image
docker build -t nvim

# Run the container
docker run --rm -it \
  -v $(pwd)/nvim_config:/root/.config/nvim \
  -v $(pwd)/nvim_data:/root/.local/share/nvim \
  -v $(pwd)/nvim_state:/root/.local/state/nvim \
  -v $(pwd)/nvim_cache:/root/.cache/nvim \
  nvim

