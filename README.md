# QZXingBinaries
Binaries for QZXing Library (https://github.com/ftylitak/qzxing)

In our repository all binaries build from this [commit](https://github.com/ftylitak/qzxing/commit/d61f2ac9821a1f52655092c588c498ca8db1f2c9).

**For building on Windows I used:**
* msvc2017
* msvc2015 for x86 binaries
* MinGW x32

**For building on Android I used:**
* JDK 1.8.0_162
* SDK 26.0.1
* NDK 10.4.0

**For building on iOS and macOS I used:**
* Apple LLVM version 9.0.0 (clang-900.0.38)

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

**For windows you'll get:**

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
