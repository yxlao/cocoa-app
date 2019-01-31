cocoa-app
=========

Simple CMake-based cocoa application

[![Build Status](https://travis-ci.org/forexample/cocoa-app.png?branch=master)](https://travis-ci.org/forexample/cocoa-app)

### Usage
```bash
mkdir build
cd build
cmake -G Xcode  ..
cmake --build . --target foo
rm -rf /Applications/foo.app && cp -r Debug/foo.app /Applications
```
