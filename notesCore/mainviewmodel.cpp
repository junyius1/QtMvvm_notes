#include "mainviewmodel.h"
#include <QtCore/QTimer>
#include <QtCore/QDebug>
#include "message.h"
#include "tabviewmodel.h"

const QString MainViewModel::KeyActive = QStringLiteral("active");
const QString MainViewModel::KeyNames = QStringLiteral("names");

MainViewModel::MainViewModel(QObject *parent) :
	ViewModel(parent),
    _name()
{}

MainViewModel::~MainViewModel()
{
	qInfo(Q_FUNC_INFO);
}

QString MainViewModel::name() const
{
	return _name;
}


void MainViewModel::setName(QString name)
{
	if (_name == name)
		return;

	_name = std::move(name);
	emit nameChanged(_name);

}


void MainViewModel::showTabs()
{
	show<TabItemViewModel>({
							   {QStringLiteral("title"), QStringLiteral("Root Tab")}
						   });
}


void MainViewModel::getInput()
{
	QtMvvm::getInput<int>(tr("Random input"),
						  tr("Enter a number:"),
						  this, [this](int res, bool ok) {

	}, 42);
}


void MainViewModel::about()
{
	QtMvvm::about(tr("QtMvvm sample application"),
				  QStringLiteral("https://github.com/Skycoder42/QtMvvm"),
				  tr("BSD 3 Clause"),
				  QStringLiteral("https://github.com/Skycoder42/QtMvvm/blob/master/LICENSE"));
}

void MainViewModel::onInit(const QVariantHash &params)
{
	qInfo() << Q_FUNC_INFO << params;

	auto names = params.value(KeyNames).toStringList();
	if(!names.isEmpty())
		setName(names.join(QLatin1Char(' ')));
}

