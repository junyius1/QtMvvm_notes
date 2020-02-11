#ifndef MAINVIEWMODEL_H
#define MAINVIEWMODEL_H

#include <QtCore/QStringListModel>

#include "viewmodel.h"

class MainViewModel : public QtMvvm::ViewModel
{
	Q_OBJECT

	Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)


public:
	static const QString KeyActive;
	static const QString KeyNames;

    Q_INVOKABLE explicit MainViewModel(QObject *parent = nullptr);
    ~MainViewModel() override;

	QString name() const;

public Q_SLOTS:
	void setName(QString name);

	void showTabs();

	void getInput();

	void about();

    void addTab();

Q_SIGNALS:
	void nameChanged(QString name);
	void activeChanged(bool active);

protected:
	void onInit(const QVariantHash &params) override;

private:
	static const quint32 ResCode = 42u;

	QString _name;
};

#endif // MAINVIEWMODEL_H
