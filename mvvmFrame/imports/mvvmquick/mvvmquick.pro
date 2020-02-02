requires(contains(QT_CONFIG, accessibility))
QT += core qml quick svg quickcontrols2
CXX_MODULE = mvvmquick
TARGETPATH = de/framework/QtMvvm/Quick
TARGET  = declarative_mvvmquick
IMPORT_VERSION = $$MODULE_VERSION_IMPORT
DEFINES += "VERSION_MAJOR=$$MODULE_VERSION_MAJOR"
DEFINES += "VERSION_MINOR=$$MODULE_VERSION_MINOR"

#DESTDIR = ../../../qml/de/framework/QtMvvm/Quick/

#TEMPLATE = lib

#CONFIG += plugin

HEADERS += \
	qtmvvmquick_plugin.h \
	qqmlquickpresenter.h \
	multifilterproxymodel.h \
	qqmlviewplaceholder.h

SOURCES += \
	qtmvvmquick_plugin.cpp \
	qqmlquickpresenter.cpp \
	multifilterproxymodel.cpp \
	qqmlviewplaceholder.cpp

INCLUDEPATH += $$PWD/../../mvvmcore $$PWD/../../mvvmquick


CONTROLS_QML_FILES += \
        QtMvvmApp.qml \
        QtMvvmApp10.qml \
        PresentingStackView.qml \
        PresentingStackView10.qml \
        PresenterProgress.qml \
        PopupPresenter.qml \
        PopupPresenter10.qml \
        DialogPresenter.qml \
        DialogPresenter10.qml \
        TintIcon.qml \
        AlertDialog.qml \
        ContrastToolBar.qml \
        ToolBarLabel.qml \
        ActionButton.qml \
        RoundActionButton.qml \
        MenuButton.qml \
        MsgBoxBase.qml \
        MsgBox.qml \
        InputDialog.qml \
        PresentingDrawer.qml \
        ListSection.qml \
        SectionListView.qml \
        OverviewListView.qml \
        SettingsView.qml \
        SearchBar.qml \
        RoundMenuButton.qml \
        DecorLabel.qml \
        MsgDelegate.qml \
        TimeTumbler.qml \
        TimeEdit.qml \
        DateEdit.qml \
        ColorHelper.qml \
        ColorEdit.qml \
        ProgressDialog.qml

static{
RESOURCES += \
        qtmvvmquick_plugin.qrc
}

OTHER_FILES += qmldir

android {
	QT += androidextras
	HEADERS += androidfilechooser.h
	SOURCES += androidfilechooser.cpp
}

#CONFIG += qmlcache

#link to core lib
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../mvvmcore/release/ -lQtMvvmCore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../mvvmcore/debug/ -lQtMvvmCore
else:unix: LIBS += -L$$OUT_PWD/../../mvvmcore/ -lQtMvvmCore

DEPENDPATH += $$PWD/../../mvvmcore

#link to widgets lib
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../mvvmquick/release/ -lQtMvvmQuick
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../mvvmquick/debug/ -lQtMvvmQuick
else:unix: LIBS += -L$$OUT_PWD/../../mvvmquick/ -lQtMvvmQuick

DEPENDPATH += $$PWD/../../mvvmquick

#WINPWD =$$PWD
#WINOUTPWD =$$DESTDIR

#win32{
#WINPWD = $$replace(PWD, "\/", "\\")
#WINOUTPWD = $$replace(DESTDIR, "\/", "\\")
#QMAKE_POST_LINK += $$QMAKE_COPY $$WINPWD\*.qml $$WINOUTPWD &&
#QMAKE_POST_LINK += $$QMAKE_COPY $$WINPWD\qmldir $$WINOUTPWD
#} else{
#QMAKE_POST_LINK += $$QMAKE_COPY $$WINPWD/*.qml $$WINOUTPWD &&
#QMAKE_POST_LINK += $$QMAKE_COPY $$WINPWD/qmldir $$WINOUTPWD
#}

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

} else {
    QML_FILES *= $$CONTROLS_QML_FILES \
                 $$PRIVATE_QML_FILES \
                 $$STYLES_QML_FILES
    OTHER_FILES += $$QML_FILES \
                 $$SHADER_FILES
}

INCLUDED_RESOURCE_FILES += $$SHADER_FILES

controls.files = $$INCLUDED_RESOURCE_FILES
controls.prefix = /de/framework/QtMvvm/Quick
!static:RESOURCES += controls

static {
 QML_FILES += $$INCLUDED_RESOURCE_FILES
}

CONFIG += no_cxx_module
load(qml_plugin)
