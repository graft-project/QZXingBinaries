QT += multimedia

DEFINES += QZXING_QML QZXING_MULTIMEDIA DISABLE_LIBRARY_FEATURES

INCLUDEPATH  += $$PWD/include

windows {
    win32-msvc* {
        contains(QMAKE_TARGET.arch, x86) {
            CONFIG(release, debug|release) {
                LIBS += -L$$PWD/libs/msvc2015_x86/release -lQZXing
            }
            CONFIG(debug, debug|release) {
                LIBS += -L$$PWD/libs/msvc2015_x86/debug -lQZXing
            }
        } else {
            CONFIG(release, debug|release) {
                LIBS += -L$$PWD/libs/msvc2017_x64/release -lQZXing
            }
            CONFIG(debug, debug|release) {
                LIBS += -L$$PWD/libs/msvc2017_x64/debug -lQZXing
            }
        }
    }

    win32-g++ {
        CONFIG(release, debug|release) {
            LIBS += -L$$PWD/libs/mingw_x86/release -lQZXing
        }
        CONFIG(debug, debug|release) {
            LIBS += -L$$PWD/libs/mingw_x86/debug -lQZXing
        }
    }
}

ios {
    LIBS_PATH = $$PWD/libs/ios
    CONFIG(release, debug|release) {
        LIBS += -L$$LIBS_PATH/release -lQZXing
    }
    CONFIG(debug, debug|release) {
        LIBS += -L$$LIBS_PATH/debug -lQZXing
    }
}

mac {
    LIBS_PATH = $$PWD/libs/mac
    CONFIG(release, debug|release) {
        LIBS += -L$$LIBS_PATH/release -lQZXing
    }
    CONFIG(debug, debug|release) {
        LIBS += -L$$LIBS_PATH/debug -lQZXing
    }
}

android {
    LIBS_PATH = $$PWD/libs/android

    equals(ANDROID_TARGET_ARCH, armeabi-v7a) {
        CONFIG(release, debug|release) {
            LIBS += -L$$LIBS_PATH/armeabi-v7a/release -lQZXing
        }
        CONFIG(debug, debug|release) {
            LIBS += -L$$LIBS_PATH/armeabi-v7a/debug -lQZXing
        }
    }

    equals(ANDROID_TARGET_ARCH, x86) {
        CONFIG(release, debug|release) {
            LIBS += -L$$LIBS_PATH/x86/release -lQZXing
        }
        CONFIG(debug, debug|release) {
            LIBS += -L$$LIBS_PATH/x86/debug -lQZXing
        }
    }
}
