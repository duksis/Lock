#!/bin/sh

# main.command

#  Created by Hugo Duksis
#  Copyright (c) 2019 Hugo Duksis, All Rights Reserved.

# Get local path of Application
FILEPATH=$(dirname "$0")
BASEPATH=${FILEPATH%/*/*/*}
echo "$BASEPATH"

/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend

exit 0
