#!/bin/fish

kitten @ set-tab-title "Core"

echo "Running core-id"
kitty @ new-window --cwd ~/Layers/layers-core-id fish -c "layers && rid; exec fish"

echo "Running core-app-web"
kitty @ new-window --cwd ~/Layers/layers-core-app-web fish -c "layers && rcw; exec fish"

echo "Running core-backend"
layers
rcb
