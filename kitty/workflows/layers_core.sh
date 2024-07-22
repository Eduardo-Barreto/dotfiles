#!/bin/zsh

kitten @ set-tab-title "Core"

echo "Running core-id"
kitty @ new-window --cwd ~/Layers/layers-core-id zsh -c "layers && rid; exec zsh"

echo "Running core-app-web"
kitty @ new-window --cwd ~/Layers/layers-core-app-web zsh -c "layers && rcw; exec zsh"

echo "Running core-backend"
layers
rcb
