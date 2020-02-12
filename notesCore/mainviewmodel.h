#ifndef MAINVIEWMODEL_H
#define MAINVIEWMODEL_H

#include "viewmodel.h"

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

class MainTabItemViewModel : public QtMvvm::ViewModel
{
    Q_OBJECT

    Q_PROPERTY(QString title READ title NOTIFY titleChanged)

    QTMVVM_CONTAINER_VM(MainViewModel)

public:
    Q_INVOKABLE explicit MainTabItemViewModel(QObject *parent = nullptr);
    ~MainTabItemViewModel() override;

    QString title() const;

Q_SIGNALS:
    void titleChanged(QString title);

protected:
    void onInit(const QVariantHash &params) override;

private:
    QString _title;
};

Q_DECLARE_METATYPE(MainViewModel*)

#endif // MAINVIEWMODEL_H
