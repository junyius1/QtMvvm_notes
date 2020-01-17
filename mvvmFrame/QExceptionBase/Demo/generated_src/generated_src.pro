QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

DEFINES += USE_EXC_NS "CUSTOM_EXPORT="

CONFIG += qexceptionbase_src_build
QEXCEPTIONBASE_NAMESPACE = generated
QEXCEPTIONBASE_EXPORT = CUSTOM_EXPORT

include(../../qexceptionbase_generated.pri)
include(../demo.pri)
