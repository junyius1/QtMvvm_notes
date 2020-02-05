TARGET = QtMvvmCore

QT = core gui

TEMPLATE=lib
#CONFIG += dll
CONFIG += c++14

HEADERS += \
	viewmodel.h \
	qtmvvmcore_global.h \
	viewmodel_p.h \
	coreapp.h \
	coreapp_p.h \
	serviceregistry.h \
	serviceregistry_p.h \
	qtmvvmcore_helpertypes.h \
	ipresenter.h \
	qtmvvm_logging_p.h \
	binding.h \
	binding_p.h \
	message.h \
	message_p.h \
	settingssetup.h \
	settingsviewmodel_p.h \
	settingsviewmodel.h \
	injection.h \
	isettingsaccessor.h \
	qsettingsaccessor.h \
	settingsentry.h \
	settingsconfigloader_p.h \
    exception.h

SOURCES += \
	viewmodel.cpp \
	coreapp.cpp \
	serviceregistry.cpp \
	qtmvvmcore_global.cpp \
	binding.cpp \
	message.cpp \
        ipresenter.cpp

DEFINES+=QT_BUILD_MVVMCORE_LIB

include(../QPluginFactory/qpluginfactory.pri)

load(qt_module)