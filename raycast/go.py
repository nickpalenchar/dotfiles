#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title go
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "#" }

# Documentation:
# @raycast.description Open Link in browser

import sys
import os
import webbrowser
print("Hello World! Argument1 value: " + sys.argv[1])

id = int(sys.argv[1])

with open(os.path.join(os.environ['HOME'], '.bookmarks.txt')) as fh:
    for linenum, link in enumerate(fh):
        if linenum+1 == id:
            print('opening link ' + link.strip())
            webbrowser.open(link.strip())
            sys.exit(0)

print('Could not find link')

