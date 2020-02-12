#include "mainviewmodel.h"
#include "message.h"

MainViewModel::MainViewModel(QObject *parent) :
    ViewModel(parent)
{}

MainViewModel::~MainViewModel()
{
    qInfo(Q_FUNC_INFO);
}

void MainViewModel::addTab()
{
    QtMvvm::getInput<QString>(tr("New Tab"), tr("Enter a tab title:"), this, [this](QString res, bool ok) {
        if(ok) {
            show<MainTabItemViewModel>({
                                       {QStringLiteral("title"), res}
                                   });
        }
    });
}



MainTabItemViewModel::MainTabItemViewModel(QObject *parent) :
    ViewModel(parent),
    _title(tr("No Title"))
{}

MainTabItemViewModel::~MainTabItemViewModel()
{
    qInfo(Q_FUNC_INFO);
}

QString MainTabItemViewModel::title() const
{
    return _title;
}

void MainTabItemViewModel::onInit(const QVariantHash &params)
{
    _title = params.value(QStringLiteral("title"), _title).toString();
    emit titleChanged(_title);
}
