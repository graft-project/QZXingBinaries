# QZXingBinaries
Binaries for QZXing Library (https://github.com/ftylitak/qzxing)

## How to build QZXing statically
Clone sources from [original repository](https://github.com/ftylitak/qzxing.git).

Go to the qzxing directory: `cd qzxing/src`, and open `QZXing.pro`.

Before `include(QZXing.pri)` add `CONFIG += qzxing_multimedia` uncomment `CONFIG += staticlib` and comment `DEFINES -= DISABLE_LIBRARY_FEATURES`. And start building the project.
After that your QZXing.pro must look as:
![QZXing.pro after editing](https://github.com/EDDragonWolf/QZXingBinaries/tree/master/images/QZXing.pro_after_editing.png).

After build you can find your static binaries in shadow build directory:

![Static binaries after build](https://github.com/EDDragonWolf/QZXingBinaries/tree/master/images/static_binaries_after_build.png)

Go to the your project and create directory `staticBinaries`, and copied static binaries in that directory, open your project and link your static binaries:

`QT += multimedia

DEFINES += QZXING_QML QZXING_MULTIMEDIA DISABLE_LIBRARY_FEATURES

INCLUDEPATH = $$PWD/staticBinaries/include

LIBS += -L$$PWD/staticBinaries/libs -lQZXing`

![QZXing.pro after editing](https://github.com/EDDragonWolf/QZXingBinaries/tree/master/images/add_static_binaries_into_your_project.png)
