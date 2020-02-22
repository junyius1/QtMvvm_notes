#include "mainviewmodel.h"
#include "message.h"
#include <QtCore/QDebug>

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

void MainTabItemViewModel::addData(const QString &data)
{
    qDebug() << data;
    auto row = _wordsModel->rowCount();
    if(_wordsModel->insertRow(row))
        _wordsModel->setData(_wordsModel->index(row), data);
}


QStringListModel *MainTabItemViewModel::wordsModel() const
{
    return _wordsModel;
}

MainTabItemViewModel::MainTabItemViewModel(QObject *parent) :
    ViewModel(parent),
    _title(tr("No Title")),
    _wordsModel(new QStringListModel(this))
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
