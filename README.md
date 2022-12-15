# Multi-build sample

## automake
 $ autoreconf -vi
 $ ./configure --prefix=/usr
 $ make
 $ ./src/myapp

 $ ./configure --host=mingw-w64-mingw32 --disable-shared
 $ make

## cmake+make
 $ mkdir -p build
 $ cd build
 $ cmake -G "Unix Makefiles" ..
 $ make
 $ ./src/myapp

## cmake+ninja
 $ rm -rf build; mkdir build
 $ cd build
 $ cmake -G "Ninja" ..
 $ ninja
 $ ./src/myapp

## meson+ninja
 $ rm -rf build
 $ mkdir -p build
 $ cd build
 $ meson ..
 $ ninja
 $ ./myapp

## scons
 $ scons
 $ ./src/myapp

