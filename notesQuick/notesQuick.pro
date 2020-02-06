TEMPLATE = app

QT += quick mvvmcore mvvmquick
CONFIG += c++14

ios: {
  TARGET = album

} else{
TARGET = notesQuick
}

DEFINES += QT_DEPRECATED_WARNINGS

INCLUDEPATH += $$PWD/../src/mvvmcore $$PWD/../src/mvvmquick

SOURCES += main.cpp

RESOURCES += \
    notesquick.qrc

TRANSLATIONS += notes_quick_de.ts \
	notes_quick_template.ts

# Link with core project
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../notesCore/release/ -lnotesCore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../notesCore/debug/ -lnotesCore
else:unix: LIBS += -L$$OUT_PWD/../notesCore/ -lnotesCore

INCLUDEPATH += $$PWD/../notesCore
DEPENDPATH += $$PWD/../notesCore

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../notesCore/release/libnotesCore.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../notesCore/debug/libnotesCore.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../notesCore/release/notesCore.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../notesCore/debug/notesCore.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../notesCore/libnotesCore.a

#link to core lib
#win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../mvvmFrame/mvvmcore/release/ -lQtMvvmCore
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../mvvmFrame/mvvmcore/debug/ -lQtMvvmCore
#else:unix: LIBS += -L$$OUT_PWD/../mvvmFrame/mvvmcore/ -lQtMvvmCore

#DEPENDPATH += $$PWD/../mvvmFrame/mvvmcore

##link to widgets lib
#win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../mvvmFrame/mvvmquick/release/ -lQtMvvmQuick
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../mvvmFrame/mvvmquick/debug/ -lQtMvvmQuick
#else:unix: LIBS += -L$$OUT_PWD/../mvvmFrame/mvvmquick/ -lQtMvvmQuick

#DEPENDPATH += $$PWD/../mvvmFrame/mvvmquick

#link to core lib
#win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../qml/de/framework/QtMvvm/Core/ -ldeclarative_mvvmcore
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../qml/de/framework/QtMvvm/Core/ -ldeclarative_mvvmcore
#else:unix: LIBS += -L$$OUT_PWD/../qml/de/framework/QtMvvm/Core/ -ldeclarative_mvvmcore

#DEPENDPATH += $$PWD/../qml/de/framework/QtMvvm/Core

##link to widgets lib
#win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../qml/de/framework/QtMvvm/Quick/ -ldeclarative_mvvmquick
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../qml/de/framework/QtMvvm/Quick/ -ldeclarative_mvvmquick
#else:unix: LIBS += -L$$OUT_PWD/../qml/de/framework/QtMvvm/Quick/ -ldeclarative_mvvmquick

#DEPENDPATH += $$PWD/../qml/de/framework/QtMvvm/Quick

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH += $$OUT_PWD/../qml

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =


android {
ANDROID_EXTRA_LIBS += \
    $$OUT_PWD/../src/mvvmcore/libQtMvvmCore.so \
    $$OUT_PWD/../src/mvvmquick/libQtMvvmQuick.so
}

ios: {
  QMAKE_TARGET_BUNDLE_PREFIX = com.power

}
win32{
WINOUTPWD =$$OUT_PWD/../bin/*
WINOUTPWD=$$replace(WINOUTPWD, "\/", "\\")
TOWINOUTPWD = $$[QT_INSTALL_BINS]
TOWINOUTPWD=$$replace(TOWINOUTPWD, "\/", "\\")
QMAKE_POST_LINK += $$QMAKE_COPY $$WINOUTPWD $$TOWINOUTPWD

message($$QMAKE_POST_LINK)
}
