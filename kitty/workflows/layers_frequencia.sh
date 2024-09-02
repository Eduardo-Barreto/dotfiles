#!/bin/zsh

source ~/.zshrc
kitten @ set-tab-title "Run Frequencia"

echo "Running web"
kitty @ new-window --cwd ~/Layers/layers-frequencia/web zsh -c "source ~/.zshrc && nvm use && yarn start; exec zsh"

echo "Running functions"
cd ~/Layers/layers-frequencia/server/functions

nvm use
yarn serve

