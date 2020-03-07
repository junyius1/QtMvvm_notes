#ifndef NOTESVIEWMODEL_H
#define NOTESVIEWMODEL_H

#include "viewmodel.h"

//所有的笔记ViewModel
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

//所有的笔记列表Tab ViewModel（有且只有一个Tab）
class NotesItemViewModel : public QtMvvm::ViewModel
{
	Q_OBJECT

	Q_PROPERTY(QString title READ title NOTIFY titleChanged)

    QTMVVM_CONTAINER_VM(NotesViewModel)

public:
    Q_INVOKABLE explicit NotesItemViewModel(QObject *parent = nullptr);
    ~NotesItemViewModel() override;

	QString title() const;

Q_SIGNALS:
	void titleChanged(QString title);

protected:
	void onInit(const QVariantHash &params) override;

private:
	QString _title;
};

Q_DECLARE_METATYPE(NotesViewModel*)

#endif // NOTESVIEWMODEL_H
