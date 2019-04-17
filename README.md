# QZXingBinaries
Binaries for QZXing Library (https://github.com/ftylitak/qzxing)

### In our repository all binaries build from this [commit](https://github.com/ftylitak/qzxing/commit/d61f2ac9821a1f52655092c588c498ca8db1f2c9) (commit hash d61f2ac9821a1f52655092c588c498ca8db1f2c9)

**Binaries build environment configuration:**

| Title             | Version                            |
| ----------------  | ---------------------------------- |
| Qt Creator        | (Mac OS - 4.8.0) (Windows - 4.8.1) |
| Qt                | 5.12.2                             |

**For building on Windows were used:**
* msvc2017
* msvc2015 for x86 binaries
* MinGW x32

* msvc2017 x64
* MinGW x64/x86
* msvc2015 for x86 binaries

**For building on Android were used:**
* JDK 1.8.0_162
* SDK 26.0.1
* NDK 19.4.0
* platforms API - android-28
* compiler - Clang

**For building on iOS and macOS were used:**
* Apple LLVM version 10.0.0 (clang-1000.11.45.5)

**For building on Linux (Ubuntu 18.04) were used:**
* gcc version 7.3.0 (Ubuntu 7.3.0-27ubuntu1~18.04)

## How to build QZXing statically
Clone sources from [original repository](https://github.com/ftylitak/qzxing.git).

Go to the qzxing directory: `cd qzxing/src`, and open `QZXing.pro`.

Before `include(QZXing.pri)` add `CONFIG += qzxing_multimedia` uncomment `CONFIG += staticlib` and comment `DEFINES -= DISABLE_LIBRARY_FEATURES`. And start building the project.
After that your QZXing.pro must look as:
```
...
CONFIG += qzxing_multimedia

include(QZXing.pri)

VERSION = 2.3

TARGET = QZXing
TEMPLATE = lib

CONFIG += staticlib

#DEFINES -= DISABLE_LIBRARY_FEATURES
symbian {
    TARGET.UID3 = 0xE618743C
    TARGET.EPOCALLOWDLLDATA = 1
    addFiles.sources = QZXing.dll
    addFiles.path = !:/sys/bin
    DEPLOYMENT += addFiles
...
```

After build you can find your static binaries in shadow build directory.

**For Windows you'll get:**

on debug  `QZXing.lib` and `QZXing2.pdb`

on release `QZXing.lib`.

**For Android, iOS, MacOS and Windows MinGW you'll get:** 

on debug and release mode `libQZXing.a`.

Go to the your project and create directory `staticBinaries`, and copied static binaries in that directory, open your project and link your static binaries:

```
QT += multimedia quick qml

DEFINES += QZXING_QML QZXING_MULTIMEDIA DISABLE_LIBRARY_FEATURES

INCLUDEPATH = $$PWD/staticBinaries/include
LIBS += -L$$PWD/staticBinaries/libs -lQZXing

CONFIG += c++11 qzxing_multimedia
...
```
