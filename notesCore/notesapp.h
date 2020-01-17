#ifndef NOTESAPP_H
#define NOTESAPP_H

#include "coreapp.h"

class notesApp : public QtMvvm::CoreApp
{
    Q_OBJECT

public:
    explicit notesApp(QObject *parent = nullptr);

protected:
    void performRegistrations() override;
    int startApp(const QStringList &arguments) override;
};

#undef coreApp
#define coreApp static_cast<notesApp*>(CoreApp::instance())

#endif // NOTESAPP_H
