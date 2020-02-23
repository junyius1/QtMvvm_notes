#include "clipboard.h"

Clipboard::Clipboard(QObject *parent) : QObject(parent){
    clipboard = QGuiApplication::clipboard();
//    connect(clipboard,SIGNAL(changed(QClipboard::Mode)),this,SLOT(changed(QClipboard::Mode)));
}

void Clipboard::setText(QString text)
{
    clipboard->setText(text,QClipboard::Clipboard);
}

const QString Clipboard::text()
{
    return clipboard->text();
}

//void Clipboard::changed(QClipboard::Mode mode)
//{
//    QVariant returnedValue;
//    QVariant msg = clipboard->text(mode);
//    QMetaObject::invokeMethod(this, "showDialog", Q_RETURN_ARG(QVariant, returnedValue),Q_ARG(QVariant, msg));
//}
