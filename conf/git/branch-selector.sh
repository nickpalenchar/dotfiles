#!/bin/bash

# Set project path
BRANCH_SELECTOR_DIR="$HOME/git-branch-selector"
MENU_SCRIPT="$BRANCH_SELECTOR_DIR/src/menu.ts"

# Check if bun is installed
if ! command -v bun &> /dev/null; then
    echo "'bun' is not installed. Please install it first: https://bun.sh"
    exit 1
fi

# Check if branch selector exists; if not, clone the repository
if [ ! -f "$MENU_SCRIPT" ]; then
    echo "Cloning git-branch-selector repository..."
    git clone git@github.com:nickpalenchar/git-branch-selector.git "$BRANCH_SELECTOR_DIR"

    # Install dependencies
    echo "Installing dependencies..."
    cd "$BRANCH_SELECTOR_DIR" || exit 1
    bun install
fi

# Run the menu script
echo "Running Git Branch Selector..."
bun run "$MENU_SCRIPT"
