# QZXingBinaries
Binaries for QZXing Library (https://github.com/ftylitak/qzxing)

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
### For windows you'll get:
on debug  `QZXing.lib` and `QZXing2.pdb`

on release `QZXing.lib`.

### For Android iOS MacOS and Windows MinGW you'll get in debug and release mode:
`libQZXing.a`

Go to the your project and create directory `staticBinaries`, and copied static binaries in that directory, open your project and link your static binaries:

```
QT += multimedia quick qml

DEFINES += QZXING_QML QZXING_MULTIMEDIA DISABLE_LIBRARY_FEATURES

INCLUDEPATH = $$PWD/staticBinaries/include
LIBS += -L$$PWD/staticBinaries/libs -lQZXing

TEMPLATE = app

CONFIG += c++11 qzxing_multimedia

CONFIG(debug, debug|release) {
    CONFIG+=qml_debug
} else {

...

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

#include(../../src/QZXing.pri)

# Default rules for deployment.
include(deployment.pri)

...
```
