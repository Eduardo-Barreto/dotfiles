#!/bin/zsh

source ~/.zshrc
kitten @ set-tab-title "Run Core"

echo "Running core-id"
kitty @ new-window --cwd ~/Layers/layers-core-id zsh -c "source ~/.zshrc && nvm use && yarn start; exec zsh"

echo "Running core-app-web"
kitty @ new-window --cwd ~/Layers/layers-core-app-web zsh -c "source ~/.zshrc && nvm use && yarn start; exec zsh"

echo "Running core-backend"
cd ~/Layers/layers-core-backend
sudo docker compose up -d
nvm use
yarn start

