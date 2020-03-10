#include "notesviewmodel.h"
#include "message.h"
#include <QtCore/QDebug>
#include "notesmodel.h"

NotesViewModel::NotesViewModel(QObject *parent) :
    ViewModel(parent)
{}

NotesViewModel::~NotesViewModel()
{
    qInfo(Q_FUNC_INFO);
}

//添加一个tab
void NotesViewModel::addTab()
{
    QtMvvm::getInput<QString>(tr("New Tab"), tr("Enter a tab title:"), this, [this](QString res, bool ok) {
        if(ok) {
            show<NotesTabItemViewModel>({
                                       {QStringLiteral("title"), res}
                                   });
        }
    });
}

//添加笔记本的一项记录
void NotesTabItemViewModel::addData(const QString &data)
{
    _notesModel->addData(data);
}


QStandardItemModel *NotesTabItemViewModel::notesModel() const
{
    return _notesModel->noteCatalogs();
}

NotesTabItemViewModel::NotesTabItemViewModel(QObject *parent) :
    ViewModel(parent),
    _title(tr("No Title")),
    _notesModel(NotesModel::instance())
{}

NotesTabItemViewModel::~NotesTabItemViewModel()
{
    qInfo(Q_FUNC_INFO);
}

QString NotesTabItemViewModel::title() const
{
    return _title;
}

void NotesTabItemViewModel::onInit(const QVariantHash &params)
{
    _title = params.value(QStringLiteral("title"), _title).toString();
    emit titleChanged(_title);
}
