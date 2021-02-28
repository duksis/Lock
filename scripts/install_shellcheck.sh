#!/bin/sh

## $ brew install shellcheck
## as brew takes more than 30 seconds to install
## shellcheck we are downloading the executable
## manually

if [ ! -x shellcheck-latest/shellcheck ]; then
  wget -qO- "https://github.com/koalaman/shellcheck/releases/download/latest/shellcheck-latest.darwin.x86_64.tar.xz" | tar -xJv
fi

shellcheck-latest/shellcheck --version
