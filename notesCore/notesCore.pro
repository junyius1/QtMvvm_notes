TEMPLATE = lib

# Creating a static library is typically more efficient. You can still create a shared library if you want to
CONFIG += c++14 static

QT += sql

TARGET = notesCore

DEFINES += QT_DEPRECATED_WARNINGS

INCLUDEPATH += $$PWD/../src/mvvmcore

HEADERS += \
    common.h \
	notesapp.h \
        mainviewmodel.h \
        drawerviewmodel.h \
        clipboard.h \
        initdb.h \
    notesmodel.h \
        common.h \
    notesviewmodel.h

SOURCES += \
	notesapp.cpp \
        mainviewmodel.cpp \
        drawerviewmodel.cpp \
        clipboard.cpp \
    notesmodel.cpp \
        initdb.cpp \
        notesviewmodel.cpp \
        common.cpp

TRANSLATIONS += notes_core_de.ts \
	notes_core_template.ts

DISTFILES += $$TRANSLATIONS
notesCore.depends += src
