#!/bin/zsh

kitten @ set-tab-title "Frequencia"

echo "Running web"
kitty @ new-window --cwd ~/Layers/layers-frequencia/web zsh -c "layers && rfreqw; exec zsh"

echo "Running functions"
layers
rfreqf
