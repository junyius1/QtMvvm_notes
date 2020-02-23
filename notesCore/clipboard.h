#ifndef CLIPBOARD_H
#define CLIPBOARD_H

#include <QGuiApplication>
#include <QObject>
#include <QClipboard>

class Clipboard : public QObject
{
    Q_OBJECT
public:
    explicit Clipboard(QObject *parent = nullptr);
    Q_INVOKABLE void setText(QString text);

public Q_SLOTS:
//    void changed(QClipboard::Mode mode);
    const QString text();

private:
    QClipboard *clipboard;
};

#endif // CLIPBOARD_H
