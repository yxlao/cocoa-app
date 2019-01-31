cocoa-app
=========

Simple CMake-based cocoa application

[![Build Status](https://travis-ci.org/forexample/cocoa-app.png?branch=master)](https://travis-ci.org/forexample/cocoa-app)

### Usage
To build as XCode target
```bash
mkdir build
cd build
cmake -GXcode  .. && cmake --build . --target && rm -rf /Applications/open3d-viewer.app && cp -r Debug/open3d-viewer.app /Applications
```

To build as normal target, this is no longer working
```bash
cmake .. && make -j && rm -rf /Applications/open3d-viewer.app && cp -r open3d-viewer.app /Applications
```

```bash
cmake ..
make -j
rm -rf /Applications/open3d-viewer.app
cp -r open3d-viewer.app /Applications
```