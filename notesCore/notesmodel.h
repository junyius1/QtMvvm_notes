#ifndef NOTESMODEL_H
#define NOTESMODEL_H

#include <QObject>
#include <QStandardItemModel>
#include "initdb.h"

class NotesModel : public QObject
{
    Q_OBJECT
public:
    explicit NotesModel(QObject *parent = nullptr);
    static NotesModel * instance();

signals:
    void enterNoteName();

public slots:
    //words表的内存结构
    QStandardItemModel *noteWords()
    {
        return _noteWords;
    }
    //notes（笔记目录）表的内存结构
    QStandardItemModel *noteCatalogs() const
    {
        return _noteCatalogs;
    }
    //conifgs表的内存结构
    const QMap<QString, QString> &configsMap() const
    {
        return _configsMap;
    }

    //NotesModel切换words model（相当于把notes表（笔记本目录（集合）表）里面的每个item（每个item代表一个表）切换了，就是笔记本表的切换）
    bool changeWordsModel(const QString &noteName);
    //添加NoteName
    bool addNoteName(const QString &noteName);
    bool updateCurNoteName(const QString &noteName);
    //添加一个条目到一个叫_curNoteName的Note表（数据库和内存）里面
    bool addData(const QString &data);
    const QString getCurNodeName();
    QString getValue(const QString &key);

private:
    static NotesModel *_instance;

    QString _curNoteName;
    QStandardItemModel *_noteWords;//笔记的条目
    QStandardItemModel *_noteCatalogs;//笔记名字数据列表（笔记名字目录）
    QMap<QString, QString> _configsMap;//配置key-value映射
    QSqlQuery _sql;
};

#endif // NOTESMODEL_H
