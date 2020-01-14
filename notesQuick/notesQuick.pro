TEMPLATE = app

QT += quick mvvmquick
CONFIG += c++14

TARGET = notesQuick

DEFINES += QT_DEPRECATED_WARNINGS

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

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =
