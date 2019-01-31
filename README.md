cocoa-app
=========

Simple CMake-based cocoa application

[![Build Status](https://travis-ci.org/forexample/cocoa-app.png?branch=master)](https://travis-ci.org/forexample/cocoa-app)

### Usage
```bash
mkdir build
cd build
cmake -GXcode  ..
cmake --build . --target
rm -rf /Applications/open3d-viewer.app && cp -r Debug/open3d-viewer.app /Applications
```
