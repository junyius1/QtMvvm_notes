QT += core qml quick mvvmcore
CXX_MODULE = mvvmcore
TARGETPATH = de/framework/QtMvvm/Core
TARGET  = declarative_mvvmcore
IMPORT_VERSION = $$MODULE_VERSION_IMPORT
DEFINES += "VERSION_MAJOR=$$MODULE_VERSION_MAJOR"
DEFINES += "VERSION_MINOR=$$MODULE_VERSION_MINOR"

#DESTDIR = ../../../qml/de/framework/QtMvvm/Core/

INCLUDEPATH += $$PWD/../../mvvmcore


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


qtquickcompiler {
    DEFINES += ALWAYS_LOAD_FROM_RESOURCES
} else {
    QML_FILES += $$CONTROLS_QML_FILES
    !static: CONFIG += qmlcache
    else: CONTROLS_QML_FILES += qmldir
}



OTHER_FILES += doc/src/*


osx: LIBS_PRIVATE += -framework Carbon

!qmlcache {
    INCLUDED_RESOURCE_FILES = \
        $$CONTROLS_QML_FILES \
        $$PRIVATE_QML_FILES \
        $$STYLES_QML_FILES

} else: {
    QML_FILES *= $$CONTROLS_QML_FILES \
                 $$PRIVATE_QML_FILES \
                 $$STYLES_QML_FILES
    OTHER_FILES += $$QML_FILES \
                 $$SHADER_FILES
}

INCLUDED_RESOURCE_FILES += $$SHADER_FILES

controls.files = $$INCLUDED_RESOURCE_FILES
controls.prefix = /de/framework/QtMvvm/Core
!static:RESOURCES += controls

android{
    TEMPLATE = lib

    CONFIG += plugin
    CONFIG += qmlcache

    #link to core lib
    win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../mvvmcore/release/ -lQtMvvmCore
    else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../mvvmcore/debug/ -lQtMvvmCore
    else:unix: LIBS += -L$$OUT_PWD/../../mvvmcore/ -lQtMvvmCore

} else:{

#    WINPWD =$$PWD
#    WINOUTPWD =$$DESTDIR

#    win32{
#        WINPWD = $$replace(PWD, "\/", "\\")
#        WINOUTPWD = $$replace(DESTDIR, "\/", "\\")
#        QMAKE_POST_LINK += $$QMAKE_COPY $$WINPWD\qmldir $$WINOUTPWD
#    } else:{
#        QMAKE_POST_LINK += $$QMAKE_COPY $$WINPWD/qmldir $$WINOUTPWD
#    }
    CONFIG += no_cxx_module
    load(qml_plugin)
}


