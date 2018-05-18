QT += multimedia

DEFINES += QZXING_QML QZXING_MULTIMEDIA DISABLE_LIBRARY_FEATURES

INCLUDEPATH  += $$PWD/include

windows {
    win32-msvc* {
        contains(QMAKE_TARGET.arch, x86) {
            release {
                LIBS += -L$$PWD/libs/msvc2015_x86/release -lQZXing
            }
            debug {
                LIBS += -L$$PWD/libs/msvc2015_x86/debug -lQZXing
            }
        } else {
            release {
                LIBS += -L$$PWD/libs/msvc2017_x64/release -lQZXing
            }
            debug {
                LIBS += -L$$PWD/libs/msvc2017_x64/debug -lQZXing
            }
        }
    }

    win32-g++ {
        release {
            LIBS += -L$$PWD/libs/mingw_x86/release -lQZXing
        }
        debug {
            LIBS += -L$$PWD/libs/mingw_x86/debug -lQZXing
        }
    }
}

mac {
    LIBS_PATH = -L$$PWD/libs/mac
    release {
        LIBS += -L$$LIBS_PATH/release -lQZXing
    }
    debug {
        LIBS += -L$$LIBS_PATH/debug -lQZXing
    }
}

ios {
    LIBS_PATH = -L$$PWD/libs/ios
    release {
        LIBS += -L$$LIBS_PATH/release -lQZXing
    }
    debug {
        LIBS += -L$$LIBS_PATH/debug -lQZXing
    }
}

android {
    LIBS_PATH = $$PWD/libs/android

    equals(ANDROID_TARGET_ARCH, armeabi-v7a) {
        release {
            LIBS += -L$$LIBS_PATH/armeabi-v7a/release -lQZXing
        }
        debug {
            LIBS += -L$$LIBS_PATH/armeabi-v7a/debug -lQZXing
        }
    }

    equals(ANDROID_TARGET_ARCH, x86) {
        release {
            LIBS += -L$$LIBS_PATH/x86/release -lQZXing
        }
        debug {
            LIBS += -L$$LIBS_PATH/x86/debug -lQZXing
        }
    }
}
