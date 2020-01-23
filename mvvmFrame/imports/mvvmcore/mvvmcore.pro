QT += core qml quick
CXX_MODULE = mvvmcore
TARGETPATH = de/framework/QtMvvm/Core
TARGET  = declarative_mvvmcore
IMPORT_VERSION = $$MODULE_VERSION_IMPORT
DEFINES += "VERSION_MAJOR=$$MODULE_VERSION_MAJOR"
DEFINES += "VERSION_MINOR=$$MODULE_VERSION_MINOR"

DESTDIR = ../../../qml/de/framework/QtMvvm/Core/

INCLUDEPATH += $$PWD/../../mvvmcore

TEMPLATE = lib

CONFIG += plugin

HEADERS += \
	qtmvvmcore_plugin.h \
	qqmlmvvmbinding.h \
	qqmlmvvmmessage.h \
	qqmlserviceregistry.h \
	qqmlcoreapp.h

SOURCES += \
	qtmvvmcore_plugin.cpp \
	qqmlmvvmbinding.cpp \
	qqmlmvvmmessage.cpp \
	qqmlserviceregistry.cpp \
        qqmlcoreapp.cpp

OTHER_FILES += qmldir

CONFIG += qmlcache


#link to core lib
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../mvvmcore/release/ -lQtMvvmCore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../mvvmcore/debug/ -lQtMvvmCore
else:unix: LIBS += -L$$OUT_PWD/../../mvvmcore/ -lQtMvvmCore

WINPWD = $$replace(PWD, "\/", "\\")
WINOUTPWD = $$replace(DESTDIR, "\/", "\\")

QMAKE_POST_LINK += $$QMAKE_COPY $$WINPWD\qmldir $$WINOUTPWD


