#!/bin/sh

# main.command

#  Created by Hugo Duksis
#  Copyright (c) 2019 Hugo Duksis, All Rights Reserved.

# Get local path of Application
FILEPATH=$(dirname "$0")
BASEPATH=${FILEPATH%/*/*/*}
echo "$BASEPATH"

CGSESSION_PATH="/System/Library/CoreServices/\"Menu Extras\"/User.menu/Contents/Resources/CGSession"

if [ -f "$FILE" ]; then
  # Susspend session with CGSession
  $CGSESSION_PATH -suspend
else
  # Susspend session by keystrokes through osascript
  osascript -e 'tell application "System Events" to keystroke "q" using {command down,control down}'
fi

exit 0
