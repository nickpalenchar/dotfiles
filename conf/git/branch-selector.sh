#!/bin/bash

BRANCH_SELECTOR_DIR="$HOME/git-branch-selector"

if [ -z "$(which git-branch-selector)" ]; then
    echo "Cloning git-branch-selector repository..."
    if [ ! -d "$BRANCH_SELECTOR_DIR" ]; then
        git clone git@github.com:nickpalenchar/git-branch-selector.git "$BRANCH_SELECTOR_DIR"
    fi
    CURRENT_DIR=$(pwd)
    cd "$BRANCH_SELECTOR_DIR/package"
    echo "Building git-branch-selector..."
    go build -o git-branch-selector
    echo "Copying git-branch-selector to /usr/local/bin..."
    sudo mv git-branch-selector /usr/local/bin/
    cd "$CURRENT_DIR"
fi

git-branch-selector