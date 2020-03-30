#include "qtmvvmquick_plugin.h"

#include <QtQml>

#include "inputviewfactory.h"

#include "qqmlquickpresenter.h"
//#include "settingsuibuilder.h"
#include "qqmlviewplaceholder.h"
#ifdef Q_OS_ANDROID
#include "androidfilechooser.h"
#endif

struct QmldirStruct {
    const char *type;
    int major, minor;
};

static const QmldirStruct stylesQmldir [] = {
    { "ActionButton", 1, 1 },
    { "AlertDialog", 1, 1 },
    { "ColorEdit", 1, 1 },
    { "ColorHelper", 1, 1 },
    { "ContrastToolBar", 1, 1 },
    { "DateEdit", 1, 1 },
    { "DecorLabel", 1, 1 },
    { "DialogPresenter", 1, 1 },
//    { "DialogPresenter10", 1, 1 },
    { "InputDialog", 1, 1 },
    { "ListSection", 1, 1 },
    { "MenuButton", 1, 1 },
    { "MsgBox", 1, 1 },
    { "MsgBoxBase", 1, 1 },
    { "MsgDelegate", 1, 1 },
    { "OverviewListView", 1, 1 },
    { "PopupPresenter", 1, 1 },
//    { "PopupPresenter10", 1, 1 },
    { "PresenterProgress", 1, 1 },
    { "PresentingDrawer", 1, 1 },
    { "PresentingStackView", 1, 1 },
//    { "PresentingStackView10", 1, 1 },
    { "ProgressDialog", 1, 1 },
    { "QtMvvmApp", 1, 1 },
//    { "QtMvvmApp10", 1, 1 },
    { "RoundActionButton", 1, 1 },
    { "RoundMenuButton", 1, 1 },
    { "SearchBar", 1, 1 },
    { "SectionListView", 1, 1 },
    { "SettingsView", 1, 1 },
    { "TimeEdit", 1, 1 },
    { "TimeTumbler", 1, 1 },
    { "TintIcon", 1, 1 },
    { "ToolBarLabel", 1, 1 }
};

static void initResources()
{
#ifdef QT_STATIC
	Q_INIT_RESOURCE(qtmvvmquick_plugin);
#endif
}

static QObject *createQuickPresenterQmlSingleton(QQmlEngine *qmlEngine, QJSEngine *jsEngine)
{
	Q_UNUSED(jsEngine)
	return new QtMvvm::QQmlQuickPresenter(qmlEngine);
}

QtMvvmQuickDeclarativeModule::QtMvvmQuickDeclarativeModule(QObject *parent) :
    QQmlExtensionPlugin(parent)
{
	initResources();
}

QString QtMvvmQuickDeclarativeModule::fileLocation() const
{
#ifndef QT_STATIC
    if (isLoadedFromResource())
        return "qrc:/de/framework/QtMvvm/Quick";
    return baseUrl().toString();
#else
    return "qrc:/qt-project.org/imports/de/framework/QtMvvm/Quick";
#endif
}

bool QtMvvmQuickDeclarativeModule::isLoadedFromResource() const
{
#ifdef QT_STATIC
    // When static it is included automatically
    // for us.
    return false;
#endif
#if defined(ALWAYS_LOAD_FROM_RESOURCES)
    return true;
#else
    // If one file is missing, it will load all the files from the resource
    QFile file(baseUrl().toLocalFile() + "/ApplicationWindow.qml");
    if (!file.exists())
        return true;
    return false;
#endif
}

void QtMvvmQuickDeclarativeModule::registerTypes(const char *uri)
{
	Q_ASSERT(qstrcmp(uri, "de.framework.QtMvvm.Quick") == 0);

	//Version 1.0
	qmlRegisterUncreatableType<QtMvvm::InputViewFactory>(uri, 1, 0, "InputViewFactory", QStringLiteral("InputViewFactories can only be created from C++ via the QuickPresenter"));
	qmlRegisterSingletonType<QtMvvm::QQmlQuickPresenter>(uri, 1, 0, "QuickPresenter", createQuickPresenterQmlSingleton);

//	qmlRegisterType<QtMvvm::SettingsUiBuilder>(uri, 1, 0, "SettingsUiBuilder");

#ifdef Q_OS_ANDROID
	qmlRegisterType<QtMvvm::AndroidFileChooser>(uri, 1, 0, "FileChooser");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/de/framework/qtmvvm/quick/qml/AndroidFileDialog.qml")), uri, 1, 0, "FileDialog");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/de/framework/qtmvvm/quick/qml/AndroidFolderDialog.qml")), uri, 1, 0, "FolderDialog");
#else
	qmlRegisterType(QUrl(QStringLiteral("qrc:/de/framework/qtmvvm/quick/qml/FileDialog.qml")), uri, 1, 0, "FileDialog");
	qmlRegisterType(QUrl(QStringLiteral("qrc:/de/framework/qtmvvm/quick/qml/FolderDialog.qml")), uri, 1, 0, "FolderDialog");
#endif

	//Version 1.1
	qmlRegisterType<QtMvvm::QQmlViewPlaceholder>(uri, 1, 1, "ViewPlaceholder");

    const QString filesLocation = fileLocation();
//    qDebug("qDebug11------------------");
//    qDebug(uri);

    const QString baseStyleLocation = filesLocation;// + "/Styles/Base";
    for (int i = 0; i < int(sizeof(stylesQmldir)/sizeof(stylesQmldir[0])); i++)
        qmlRegisterType(QUrl(baseStyleLocation + "/" + stylesQmldir[i].type + ".qml"), uri,
                        stylesQmldir[i].major, stylesQmldir[i].minor, stylesQmldir[i].type);

//     qDebug("qDebug22------------------");

	// Check to make sure no module update is forgotten
	static_assert(VERSION_MAJOR == 1 && VERSION_MINOR == 1, "QML module version needs to be updated");
}
