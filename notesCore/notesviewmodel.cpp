#include "notesviewmodel.h"
#include "message.h"

NotesViewModel::NotesViewModel(QObject *parent) :
	ViewModel(parent)
{}

NotesViewModel::~NotesViewModel()
{
	qInfo(Q_FUNC_INFO);
}

//notes的viewmodel添加tab
void NotesViewModel::addTab()
{
	QtMvvm::getInput<QString>(tr("New Tab"), tr("Enter a tab title:"), this, [this](QString res, bool ok) {
		if(ok) {
            show<NotesItemViewModel>({
									   {QStringLiteral("title"), res}
								   });
		}
	});
}

NotesItemViewModel::NotesItemViewModel(QObject *parent) :
	ViewModel(parent),
	_title(tr("No Title"))
{}

NotesItemViewModel::~NotesItemViewModel()
{
	qInfo(Q_FUNC_INFO);
}

QString NotesItemViewModel::title() const
{
	return _title;
}

void NotesItemViewModel::onInit(const QVariantHash &params)
{
	_title = params.value(QStringLiteral("title"), _title).toString();
	emit titleChanged(_title);
}
