#!/bin/bash
echo "== Installed versions =="
python3 --version
pip --version
node --version
npm --version
nvim --version
git --version
echo "========================"
exec "$@"