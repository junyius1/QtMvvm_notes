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

#ifndef INITDB_H
#define INITDB_H

#include <QtSql>
const auto CONFIGS_TABLE = QLatin1String(R"(configs)");
const auto NOTES_TABLE = QLatin1String(R"(notes)");

//创建configs表
const auto CREATE_CONFIGS_SQL = QLatin1String(R"(
    create table configs(id integer primary key, value varchar)
    )");

//插入configs表
const auto INSERT_CONFIGS_SQL = QLatin1String(R"(
    insert into configs(key, value) values(?, ?)
    )");

//通过configs表的key设置value
const auto UPDATE_CONFIGS_SQL = QLatin1String(R"(
    update configs set value = ? where key = ?
    )");

//创建notes
const auto CREATE_NOTES_SQL = QLatin1String(R"(
    create table notes(id integer primary key, note varchar)
    )");

//插入notes
const auto INSERT_NOTES_SQL = QLatin1String(R"(
    insert into notes(note) values(?)
    )");

//创建words表
const auto CREATE_CONTENT_TABLE_SQL = QLatin1String(R"(
    create table ?(id integer primary key, content varchar)
    )");

//words表结构是id, content，名字在notes表里面
const auto INSERT_CONTENT_TABLE_SQL = QString(QLatin1String(R"(
    insert into %1(content) values(?)
    )"));

//从words表中选择所有的数据
const auto SELECT_ALL_DATA_FROM_TABLE = QLatin1String(R"(
    select * from ?
    )");

//插入notes表
bool insertNotes(QSqlQuery &q, const QString &noteName);

//通过key去设置configs表的value
bool updateConfigs(QSqlQuery &q, const QString &key, const QString &value);

//插入configs表
bool insertConfigs(QSqlQuery &q, const QString &key, const QString &value);

//插入content到名字叫table的表，这个表的结构是words
bool insertTableContent(QSqlQuery &q, const QString &table, const QString &content);

//选择名字叫tableName的表所有数据，这个表的结构是words
bool selectTableAllData(QSqlQuery &q, const QString &tableName);

//创建名字为table的表
QSqlError createTable(QSqlQuery &q, const QString &table);

//初始化db，创建QSQLITE数据库的notes，如果还未包含notes表（也就未曾初始化notes数据库），创建notes表，创建configs表
QSqlError initDb(QSqlQuery &q);

#endif
