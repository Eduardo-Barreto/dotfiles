#!/bin/fish

kitten @ set-tab-title "Frequencia"

echo "Running web"
kitty @ new-window --cwd ~/Layers/layers-frequencia/web fish -c "layers && rfreqw; exec fish"

echo "Running functions"
layers
rfreqf
