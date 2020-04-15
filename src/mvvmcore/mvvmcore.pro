TARGET = QtMvvmCore

QT = core gui

#TEMPLATE=lib
#CONFIG += dll
CONFIG += c++14
CONFIG += git_build

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

!android{
    load(qt_module)

    win32{
        CONFIG(release, debug|release):{
            OUTLIBPWD =../../lib/Qt5MvvmCore.lib
            OUTLIBPWD=$$replace(OUTLIBPWD, "\/", "\\")
            QMAKE_PRE_LINK = $$QMAKE_DEL_FILE $$OUTLIBPWD
        }

        CONFIG(debug, debug|release):{
            OUTLIBDPWD = ../../lib/Qt5MvvmCored.lib
            OUTLIBDPWD=$$replace(OUTLIBDPWD, "\/", "\\")
            QMAKE_PRE_LINK = $$QMAKE_DEL_FILE $$OUTLIBDPWD
        }


#        extralib.target = extra
#        extralib.commands = $$QMAKE_DEL_FILE $$OUTLIBPWD; \
#                            $$QMAKE_DEL_FILE $$OUTLIBDPWD; \

#        extralib.depends =
#        QMAKE_EXTRA_TARGETS += extralib
#        PRE_TARGETDEPS = extra
    }
}
