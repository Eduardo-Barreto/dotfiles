#!/bin/zsh

source ~/.zshrc
kitten @ set-tab-title "Run Core"

echo "Running core-id"
kitty @ new-window --cwd ~/Layers/layers-core-id zsh -c "source ~/.zshrc && yarn start; zsh"

echo "Running core-app-web"
kitty @ new-window --cwd ~/Layers/layers-core-app-web zsh -c "source ~/.zshrc && yarn start; zsh"

echo "Running mock erp-modelo"
kitty @ new-window --cwd "~/Layers/mock" zsh -c "source ~/.zshrc && yarn start; zsh"

echo "Running core-backend"
cd ~/Layers/layers-core-backend
docker compose up -d
yarn start

