#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title gad
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description "go add" - add go bookmark
import subprocess
import sys
import os

link = subprocess.run('pbpaste', stdout=subprocess.PIPE).stdout.strip().decode()

if not link.startswith('http'):
    print("Link must start with http!")
    sys.exit(1)

with open(os.path.join(os.environ['HOME'], '.bookmarks.txt'), 'a') as fh:
    fh.write('\n' + link)

with open(os.path.join(os.environ['HOME'], '.bookmarks.txt'), 'rb') as fh:
    id = sum(1 for _ in fh)
    print(f'Saved! id {id}')
