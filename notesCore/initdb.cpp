/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the demonstration applications of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include <QtSql>
#include <initdb.h>
#include <common.h>

//插入notes表
bool insertNotes(QSqlQuery &q, const QString &noteName)
{
    if (!q.prepare(INSERT_NOTES_SQL))
        return false;
    q.addBindValue(noteName);
    return q.exec();
}

//通过key去设置configs表的value
bool updateConfigs(QSqlQuery &q, const QString &key, const QString &value)
{
    if (!q.prepare(UPDATE_CONFIGS_SQL))
        return false;
    q.addBindValue(value);
    q.addBindValue(key);
    return q.exec();
}

//插入configs表
bool insertConfigs(QSqlQuery &q, const QString &key, const QString &value)
{
    if (!q.prepare(INSERT_CONFIGS_SQL))
        return false;
    q.addBindValue(key);
    q.addBindValue(value);
    return q.exec();
}

//插入content到名字叫table的表，这个表的结构是words
bool insertTableContent(QSqlQuery &q, const QString &table, const QString &content)
{
    QString str = INSERT_CONTENT_TABLE_SQL.arg(table);
    if (!q.prepare(str)){
        notes::debug(q.lastError().text());
        return false;
    }
    q.addBindValue(content);
    return q.exec();
}

//选择名字叫tableName的表所有数据，这个表的结构是words
bool selectTableAllData(QSqlQuery &q, const QString &tableName)
{
    QString str = SELECT_ALL_DATA_FROM_TABLE.arg(tableName);
    if (!q.prepare(str))
        return false;
    return q.exec();
}

//创建名字为table的表
QSqlError createTable(QSqlQuery &q, const QString &table)
{
    QString str = CREATE_CONTENT_TABLE_SQL.arg(table);
    if (!q.prepare(str)){
        notes::debug(q.lastError().text());
        return q.lastError();
    }
    q.exec();
    return QSqlError();
}

//初始化db，创建QSQLITE数据库的notes，如果还未包含notes表（也就未曾初始化notes数据库），创建notes表，创建configs表
QSqlError initDb(QSqlQuery &q)
{
    QSqlDatabase db;
    // 建立和SQlite数据库的连接
    db = QSqlDatabase::addDatabase(QLatin1String(R"(QSQLITE)"));
    // 设置数据库文件的名字
    db.setDatabaseName(QLatin1String(R"(notes.db)"));

    if (!db.open())
        return db.lastError();

    q = QSqlQuery(db);

    QStringList tables = db.tables();
    if (tables.contains(QString::fromUtf8("notes"), Qt::CaseInsensitive))
        return QSqlError();

    if (!q.exec(CREATE_NOTES_SQL))
        return q.lastError();

    if (!q.exec(CREATE_CONFIGS_SQL))
        return q.lastError();

    insertConfigs(q, QLatin1String(R"(defaultNote)"), QLatin1String(R"()"));

    return QSqlError();
}

