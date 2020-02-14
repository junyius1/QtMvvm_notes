#include "drawerviewmodel.h"

#include "mainviewmodel.h"
#include "tabviewmodel.h"

DrawerViewModel::DrawerViewModel(QObject *parent) :
	ViewModel(parent),
	_navModel(new QStandardItemModel(0, 1, this))
{
	_navModel->appendRow(new QStandardItem(tr("Main Sample")));
	_navModel->appendRow(new QStandardItem(tr("Tab Sample")));

}

DrawerViewModel::~DrawerViewModel()
{
	qInfo(Q_FUNC_INFO);
}

QStandardItemModel *DrawerViewModel::navModel() const
{
	return _navModel;
}

void DrawerViewModel::open(int index)
{
	switch (index) {
	case 0:
        show<MainTabItemViewModel>({
                                       {QStringLiteral("title"), QStringLiteral("Root Tab")}
                                   });
		break;
	case 1:
		show<TabItemViewModel>({
								   {QStringLiteral("title"), QStringLiteral("Root Tab")}
							   });
		break;

	default:
		break;
	}
}
