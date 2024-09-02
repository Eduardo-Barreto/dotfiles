#!/bin/zsh

source ~/.zshrc
kitten @ set-tab-title "Run Catraca"

echo "Running web"
kitty @ new-window --cwd ~/Layers/visualizadores-nuxt/layers-catraca zsh -c "source ~/.zshrc && yarn dev; exec zsh"

echo "Running back"
cd ~/Layers/visualizadores-nuxt/visualizadores-nuxt
yarn dev 

