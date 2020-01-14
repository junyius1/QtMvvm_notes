#include "notesapp.h"
#include "mainviewmodel.h"

#include <QtCore/QCommandLineParser>

notesApp::notesApp(QObject *parent) :
    CoreApp(parent)
{
    QCoreApplication::setApplicationName(QStringLiteral("notes"));
    QCoreApplication::setApplicationVersion(QStringLiteral("1.0.0"));
    QCoreApplication::setOrganizationName(QStringLiteral("Example Organization"));
}

void notesApp::performRegistrations()
{
    //if you are using a qt resource (e.g. "notescore.qrc"), initialize it here
    //Q_INIT_RESOURCE(notescore);
}

int notesApp::startApp(const QStringList &arguments)
{
    QCommandLineParser parser;
    parser.addVersionOption();
    parser.addHelpOption();

    //add more options

    //shows help or version automatically
    if(!autoParse(parser, arguments))
        return EXIT_SUCCESS;

    //show a viewmodel to complete the startup
    show<MainViewModel>();
    return EXIT_SUCCESS;
}
