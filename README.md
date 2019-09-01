# ![logo](./assets/lock.iconset/icon_32x32.png) Lock.app [![Build Status](https://travis-ci.org/duksis/Lock.svg?branch=master)](https://travis-ci.org/duksis/Lock)

Locks your Mac

---


## Intro

A simple Mac application that does only one thing
----> It locks your Mac!

![lock through spotlight](./assets/lock_in_action.gif)


## Instalation

1. Download [the image](https://github.com/duksis/Lock/releases/download/v1.0.2/lock.dmg)
2. Open it
3. Move `Lock` app to your `Applications` folder


## Default ways

The default way to lock your macOS Mojave machine is **Command+Control+Q**

for more options there is a detailed list on [macpaw](https://macpaw.com/how-to/lock-mac-screen)


## Locking from Command-line

The [core](./Lock.app/Contents/MacOS/main.command) of this app is a simple one line call to one of MacOS core services
and if you spend most of your time in the command-line you can just create a alias for it
within your shell configuration (~/.bashrc, ~/zshrc ...)

```sh
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
```


## Development

Clone the repo:
```
git clone git@github.com:duksis/Lock
```

After making changes install the development version localy:
```
cp -Rv Lock/Lock.app /Applications/
```


## Releasing

1. run `scripts/bump_version NEW.VERSION.NUMBER`
2. push your changes
3. create a [new relase](https://github.com/duksis/Lock/releases/new)


## License
Lock.app is released under the [MIT License](./LICENSE).
