#!/bin/bash

# Set the path to your Git repository
REPO_PATH="$HOME/dotfiles"


cd "$REPO_PATH"

git add .

git commit -m "$1"

git push
