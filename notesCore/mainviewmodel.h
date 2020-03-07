#ifndef MAINVIEWMODEL_H
#define MAINVIEWMODEL_H

#include "viewmodel.h"
#include <QtCore/QStringListModel>
#include "notesmodel.h"

//notes（记事本）的viewmodel
class MainViewModel : public QtMvvm::ViewModel
{
    Q_OBJECT

    QTMVVM_SINGLETON

public:
    Q_INVOKABLE explicit MainViewModel(QObject *parent = nullptr);
    ~MainViewModel();

public Q_SLOTS:
    void addTab();
};

//notes（记事本）的tab 的viewmodel（暂时只有一个tab）
class MainTabItemViewModel : public QtMvvm::ViewModel
{
    Q_OBJECT

    Q_PROPERTY(QString title READ title NOTIFY titleChanged)
    Q_PROPERTY(QStandardItemModel* wordsModel READ wordsModel CONSTANT)

    QTMVVM_CONTAINER_VM(MainViewModel)

public:
    Q_INVOKABLE explicit MainTabItemViewModel(QObject *parent = nullptr);
    ~MainTabItemViewModel() override;

    QString title() const;

Q_SIGNALS:
    void titleChanged(QString title);

protected:
    void onInit(const QVariantHash &params) override;

public Q_SLOTS:
    //note（记事本）触发添加对话框后点击确定触发添加item
    void addData(const QString &data);
    //这个是note（记事本）的word列表
    QStandardItemModel *wordsModel() const;

private:
    QString _title;
    NotesModel *_notesModel;
};

Q_DECLARE_METATYPE(MainViewModel*)

#endif // MAINVIEWMODEL_H
