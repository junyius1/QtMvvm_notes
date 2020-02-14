#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <notesapp.h>
#include <mainviewmodel.h>

#include <drawerviewmodel.h>
#include <tabviewmodel.h>
#include "quickpresenter.h"
#include "clipboard.h"

QTMVVM_REGISTER_CORE_APP(notesApp)

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    // If you want to support file dialogs on platforms other then android, use a QApplication instead (and add QT += widgets to the pro file)
    QGuiApplication app(argc, argv);

    QtMvvm::QuickPresenter::getInputViewFactory(); //Workaround for QTBUG-69963
    qmlRegisterUncreatableType<MainViewModel>("com.cross.notes", 1, 1, "MainViewModel", "ViewModels cannot be created!");
    qmlRegisterUncreatableType<MainTabItemViewModel>("com.cross.notes", 1, 1, "MainTabItemViewModel", "ViewModels cannot be created!");
    qmlRegisterUncreatableType<DrawerViewModel>("com.cross.notes", 1, 1, "DrawerViewModel", QStringLiteral("ViewModels cannot be created"));
    qmlRegisterUncreatableType<TabViewModel>("com.cross.notes", 1, 1, "TabViewModel", QStringLiteral("ViewModels cannot be created"));
    qmlRegisterUncreatableType<TabItemViewModel>("com.cross.notes", 1, 1, "TabItemViewModel", QStringLiteral("ViewModels cannot be created"));

    qmlRegisterType<Clipboard>("Clipboard",1,0,"Clipboard");

    QQmlApplicationEngine engine;
    engine.addImportPath((QStringLiteral("../qml")));
    engine.load(QUrl(QStringLiteral("qrc:/App.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
