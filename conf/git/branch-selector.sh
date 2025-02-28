#!/bin/bash

# Set project path
BRANCH_SELECTOR_DIR="$HOME/git-branch-selector"
MENU_SCRIPT="$BRANCH_SELECTOR_DIR/src/menu.js"

# Check if branch selector exists; if not, clone the repository
if [ ! -f "$MENU_SCRIPT" ]; then
    echo "Cloning git-branch-selector repository..."
    git clone git@github.com:nickpalenchar/git-branch-selector.git "$BRANCH_SELECTOR_DIR"

    # Install dependencies
    echo "Installing dependencies..."
    cd "$BRANCH_SELECTOR_DIR" || exit 1
    npm i
fi

node "$MENU_SCRIPT"
