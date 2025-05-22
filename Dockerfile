# Use the prebuilt NVChad Neovim container as base
FROM travisdart/nvchad-neovim:latest

# Optional: Set Git author information via build args
ARG GIT_AUTHOR_EMAIL
ARG GIT_AUTHOR_NAME

RUN if [ -n "$GIT_AUTHOR_EMAIL" ] && [ -n "$GIT_AUTHOR_NAME" ]; then \
    git config --global user.email "$GIT_AUTHOR_EMAIL" && \
    git config --global user.name "$GIT_AUTHOR_NAME" \
    ; \
fi

# Copy your Neovim configuration (assuming your nvim/ directory holds your config)
COPY nvim/ /root/.config/nvim/

# Optionally: Preinstall plugins/headless setup (if desired, can be omitted)
RUN nvim --headless "+Lazy! sync" "+sleep 5" "+qa"

CMD ["nvim"]
