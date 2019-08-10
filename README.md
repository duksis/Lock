# Lock.app [![Build Status](https://travis-ci.org/duksis/Lock.svg?branch=master)](https://travis-ci.org/duksis/Lock)

Locks your Mac

---


## Intro

A simple Mac application that does only one thing
----> It locks your Mac!


## Instalation

1. Download [the image](https://github.com/duksis/Lock/releases/download/v1.0.2/lock.dmg)
2. Open it
3. Move `Lock` app to your `Applications` folder


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
