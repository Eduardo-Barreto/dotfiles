#!/bin/zsh

APP_NAME=$1
z $APP_NAME

PROJECT_PATH=$(pwd)
PROJECT_NAME=$(basename $PROJECT_PATH)

kitten @ set-tab-title "Run $PROJECT_NAME"

echo "Running web"
kitty @ new-window --cwd "$PROJECT_PATH/web" zsh -c "source ~/.zshrc && yarn start; zsh"

echo "Running server"
cd ./server/functions
yarn serve
