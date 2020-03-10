#ifndef NOTESVIEWMODEL_H
#define NOTESVIEWMODEL_H

#include "viewmodel.h"
#include <QtCore/QStringListModel>
#include "notesmodel.h"

//notes（记事本）的viewmodel
class NotesViewModel : public QtMvvm::ViewModel
{
    Q_OBJECT

    QTMVVM_SINGLETON

public:
    Q_INVOKABLE explicit NotesViewModel(QObject *parent = nullptr);
    ~NotesViewModel();

public Q_SLOTS:
    void addTab();
};

//notes（记事本）的tab 的viewmodel（暂时只有一个tab）
class NotesTabItemViewModel : public QtMvvm::ViewModel
{
    Q_OBJECT

    Q_PROPERTY(QString title READ title NOTIFY titleChanged)
    Q_PROPERTY(QStandardItemModel* notesModel READ notesModel CONSTANT)

    QTMVVM_CONTAINER_VM(NotesViewModel)

public:
    Q_INVOKABLE explicit NotesTabItemViewModel(QObject *parent = nullptr);
    ~NotesTabItemViewModel() override;

    QString title() const;

Q_SIGNALS:
    void titleChanged(QString title);

protected:
    void onInit(const QVariantHash &params) override;

public Q_SLOTS:
    //note（记事本）触发添加对话框后点击确定触发添加item
    void addData(const QString &data);
    //这个是note（记事本）的word列表
    QStandardItemModel *notesModel() const;

private:
    QString _title;
    NotesModel *_notesModel;
};

Q_DECLARE_METATYPE(NotesViewModel*)

#endif // NOTESVIEWMODEL_H
