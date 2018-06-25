QT += multimedia

DEFINES += QZXING_QML QZXING_MULTIMEDIA DISABLE_LIBRARY_FEATURES

INCLUDEPATH  += $$PWD/include

windows {
    win32-msvc* {
        contains(QMAKE_TARGET.arch, x86) {
            PLATFORM_PATH = msvc2015_x86
        } else {
            PLATFORM_PATH = msvc2017_x64
        }
    }

    win32-g++ {
        PLATFORM_PATH = mingw_x86
    }
}

ios {
    PLATFORM_PATH = ios
} else {
    mac {
        PLATFORM_PATH = mac
    }
}

android {
    equals(ANDROID_TARGET_ARCH, armeabi-v7a) {
        PLATFORM_PATH = android/armeabi-v7a
    }

    equals(ANDROID_TARGET_ARCH, x86) {
        PLATFORM_PATH = android/x86
    }
} else {
    linux {
        PLATFORM_PATH = linux
    }
}

LIBS_PATH = $$PWD/libs/$$PLATFORM_PATH
CONFIG(release, debug|release) {
    LIBS += -L$$LIBS_PATH/release -lQZXing
}
CONFIG(debug, debug|release) {
    LIBS += -L$$LIBS_PATH/debug -lQZXing
}
