QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

DEFINES += USE_EXC_NS

include(../../qexceptionbase_generated.pri)
include(../demo.pri)
