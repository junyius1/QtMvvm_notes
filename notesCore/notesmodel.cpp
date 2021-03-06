#include "notesmodel.h"

NotesModel *NotesModel::_instance = nullptr;
NotesModel::NotesModel(QObject *parent) : QObject(parent),
    _noteWords(new QStandardItemModel(0, 2, this)),
    _noteCatalogs(new QStandardItemModel(0, 2, this))
{
    initDb(_sql);
    if(selectTableAllData(_sql, CONFIGS_TABLE))
    {
        QSqlRecord rec = _sql.record();

        qDebug() << "Number of columns: " << rec.count();

        int keyCol = rec.indexOf(QLatin1String(R"(key)")); // index of the field "name"
        int valueCol = rec.indexOf(QLatin1String(R"(value)"));
        while (_sql.next())
            _configsMap[_sql.value(keyCol).toString()] = _sql.value(valueCol).toString();

    }
    _curNoteName = getValue(QLatin1String(R"(defaultNote)"));
    if(selectTableAllData(_sql, NOTES_TABLE))
    {
        QSqlRecord rec = _sql.record();
 
        qDebug() << "Number of columns: " << rec.count();

        int noteCol = rec.indexOf(QLatin1String(R"(note)")); // index of the field "name"
        int idCol = rec.indexOf(QLatin1String(R"(id)"));
        int row = 0;
        while (_sql.next()){
            _noteCatalogs->setItem(row, 0, new QStandardItem(_sql.value(noteCol).toString()));
            _noteCatalogs->setItem(row, 1, new QStandardItem(_sql.value(idCol).toString()));
            row ++;
        }
    }
//    if(_curNoteName == QLatin1String(""))
//    {
//        auto str = QLatin1String(R"(defaultDB)");
//        addNoteName(str);
//        _curNoteName = str;
//    }
    changeWordsModel(_curNoteName);
}

QString NotesModel::getValue(const QString &key)
{
    return _configsMap[key];
}

//更新当前的Note表的名字
bool NotesModel::updateCurNoteName(const QString &noteName)
{
    if (!_sql.prepare(UPDATE_CONFIGS_SQL))
        return false;
    _sql.addBindValue(noteName);
    _sql.addBindValue(QLatin1String(R"(defaultNote)"));
    if(_sql.exec())
    {
        _curNoteName = noteName;
        return true;
    }else{
        return false;
    }
}

const QString NotesModel::getCurNodeName()
{
    return _curNoteName;
}

//NotesModel切换words model（相当于把notes表（笔记本目录（集合）表）里面的每个item（每个item代表一个表）切换了，就是笔记本表的切换）
bool NotesModel::changeWordsModel(const QString &noteName)
{
    if(noteName == QLatin1String("")) return false;
    if(selectTableAllData(_sql, noteName))
    {
        QSqlRecord rec = _sql.record();

        qDebug() << "Number of columns: " << rec.count();

        int idCol = rec.indexOf(QLatin1String(R"(id)")); // index of the field "name"
        int contentCol = rec.indexOf(QLatin1String(R"(content)"));
        int row = 0;
        while (_sql.next()){
            _noteWords->setItem(row, 0, new QStandardItem(_sql.value(contentCol).toString()));
            _noteWords->setItem(row, 1, new QStandardItem(_sql.value(idCol).toString()));
            row++;
        }
    } else {
        QSqlError err = createTable(_sql, noteName);
        if(err.isValid())
        {
            qDebug() << err.databaseText();
            return false;
        }
    }
    updateCurNoteName(noteName);
    updateConfigs(_sql, QLatin1String(R"(defaultNote)"), noteName);
    return true;
}

//添加一个条目到一个叫_curNoteName的Note表（数据库和内存）里面
bool NotesModel::addData(const QString &data)
{
    _noteWords->appendRow(new QStandardItem(data));
    return insertTableContent(_sql, getCurNodeName(), data);
}

//添加note数据库名字
bool NotesModel::addNoteName(const QString &noteName)
{
    if(_curNoteName == noteName) return false;
    if( insertNotes(_sql, noteName))
    {
        return changeWordsModel(noteName);
    }
    return true;
}

NotesModel * NotesModel::instance()
{
    if(_instance)
    {
        return _instance;
    }

    _instance = new NotesModel();
    return _instance;
}
