INCLUDEPATH += $$PWD

HEADERS += \
	$$PWD/qexceptionbase.h

SOURCES += \
	$$PWD/qexceptionbase.cpp

QDEP_PACKAGE_EXPORTS += Q_EXCEPTION_BASE_EXPORT
!qdep_build: DEFINES += "Q_EXCEPTION_BASE_EXPORT="
