TARGET = QtMvvmQuick

INCLUDEPATH += $$PWD/../mvvmcore

TEMPLATE=lib
CONFIG += c++14

QT = core gui qml quick svg mvvmcore

HEADERS += \
	qtmvvmquick_global.h \
	quickpresenter.h \
	quickpresenter_p.h \
	inputviewfactory.h \
	inputviewfactory_p.h \
	formatters_p.h

SOURCES += \
	quickpresenter.cpp \
	inputviewfactory.cpp

RESOURCES += \
	qtmvvmquick_module.qrc

TRANSLATIONS += \
	translations/qtmvvmquick_de.ts \
	translations/qtmvvmquick_template.ts

DEFINES += QT_BUILD_MVVMQUICK_LIB

QM_FILES_INSTALL_PATH = $$[QT_INSTALL_TRANSLATIONS]

QML_IMPORT_PATH += $$OUT_PWD/../qml

#replace template qm by ts
QM_FILES += translations/qtmvvmquick_template.ts

include(../DialogMaster/dialogmaster.pri)
include(../QUrlValidator/qurlvalidator.pri)

android{
#link to core lib
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../mvvmcore/release/ -lQtMvvmCore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../mvvmcore/debug/ -lQtMvvmCore
else:unix: LIBS += -L$$OUT_PWD/../mvvmcore/ -lQtMvvmCore
} else {
load(qt_module)

}
