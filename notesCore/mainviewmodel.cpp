#include "mainviewmodel.h"
#include "message.h"
#include <QtCore/QDebug>
#include "notesmodel.h"

MainViewModel::MainViewModel(QObject *parent) :
    ViewModel(parent)
{}

MainViewModel::~MainViewModel()
{
    qInfo(Q_FUNC_INFO);
}

//添加一个tab
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

//添加笔记本的一项记录
void MainTabItemViewModel::addData(const QString &data)
{
    _notesModel->addData(data);
}


QStandardItemModel *MainTabItemViewModel::wordsModel() const
{
    return _notesModel->noteWords();
}

MainTabItemViewModel::MainTabItemViewModel(QObject *parent) :
    ViewModel(parent),
    _title(tr("No Title")),
    _notesModel(NotesModel::instance())
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
