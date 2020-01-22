QT += core qml quick svg quickcontrols2
CXX_MODULE = mvvmquick
TARGETPATH = de/framework/QtMvvm/Quick
TARGET  = declarative_mvvmquick
IMPORT_VERSION = $$MODULE_VERSION_IMPORT
DEFINES += "VERSION_MAJOR=$$MODULE_VERSION_MAJOR"
DEFINES += "VERSION_MINOR=$$MODULE_VERSION_MINOR"

DESTDIR = ../../../qml/de/framework/QtMvvm/Quick/

TEMPLATE = lib

CONFIG += plugin

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


RESOURCES += \
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
        ProgressDialog.qml \
	qtmvvmquick_plugin.qrc

OTHER_FILES += qmldir

android {
	QT += androidextras
	HEADERS += androidfilechooser.h
	SOURCES += androidfilechooser.cpp
}
#!android{
#        HEADERS -= androidfilechooser.h
#        SOURCES -= androidfilechooser.cpp
#}

CONFIG += qmlcache

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

WINPWD = $$replace(PWD, "\/", "\\")
WINOUTPWD = $$replace(DESTDIR, "\/", "\\")

QMAKE_POST_LINK += xcopy /Y $$WINPWD\*.qml $$WINOUTPWD &&
QMAKE_POST_LINK += xcopy /Y $$WINPWD\qmldir $$WINOUTPWD

