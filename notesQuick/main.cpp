#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <notesapp.h>
#include <mainviewmodel.h>

#include <drawerviewmodel.h>
#include <notesviewmodel.h>
#include "quickpresenter.h"
#include "clipboard.h"
#include <QQmlContext>
#include "common.h"

QTMVVM_REGISTER_CORE_APP(notesApp)

using namespace notes;

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    // If you want to support file dialogs on platforms other then android, use a QApplication instead (and add QT += widgets to the pro file)
    QGuiApplication app(argc, argv);
    char url[] = "com.cross.notes";

    QtMvvm::QuickPresenter::getInputViewFactory(); //Workaround for QTBUG-69963
    qmlRegisterUncreatableType<MainViewModel>(url, 1, 1, "MainViewModel", QStringLiteral("ViewModels cannot be created!"));
    qmlRegisterUncreatableType<MainTabItemViewModel>(url, 1, 1, "MainTabItemViewModel", QStringLiteral("ViewModels cannot be created!"));
    qmlRegisterUncreatableType<DrawerViewModel>(url, 1, 1, "DrawerViewModel", QStringLiteral("ViewModels cannot be created"));
    qmlRegisterUncreatableType<NotesViewModel>(url, 1, 1, "NotesViewModel", QStringLiteral("ViewModels cannot be created"));
    qmlRegisterUncreatableType<NotesTabItemViewModel>(url, 1, 1, "NotesTabItemViewModel", QStringLiteral("ViewModels cannot be created"));

    qmlRegisterType<Clipboard>(url,1,0,"Clipboard");

    QQmlApplicationEngine engine;
    engine.addImportPath((QStringLiteral("../qml")));
    engine.rootContext()->setContextProperty(QLatin1String(R"(notesModel)"), NotesModel::instance());
    engine.load(QUrl(QStringLiteral("qrc:/App.qml")));

//    g_qmlEngine = &engine;

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
