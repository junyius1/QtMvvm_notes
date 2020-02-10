TEMPLATE = lib

# Creating a static library is typically more efficient. You can still create a shared library if you want to
CONFIG += c++14 static

TARGET = notesCore

DEFINES += QT_DEPRECATED_WARNINGS

INCLUDEPATH += $$PWD/../src/mvvmcore

HEADERS += \
	notesapp.h \
        mainviewmodel.h \
        drawerviewmodel.h \
        tabviewmodel.h

SOURCES += \
	notesapp.cpp \
        mainviewmodel.cpp \
        drawerviewmodel.cpp \
        tabviewmodel.cpp

TRANSLATIONS += notes_core_de.ts \
	notes_core_template.ts

DISTFILES += $$TRANSLATIONS
notesCore.depends += src
