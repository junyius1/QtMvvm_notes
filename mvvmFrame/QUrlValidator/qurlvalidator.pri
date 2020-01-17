HEADERS += \
	$$PWD/qurlvalidator.h
	
SOURCES += \
	$$PWD/qurlvalidator.cpp

INCLUDEPATH += $$PWD

QDEP_PACKAGE_EXPORTS += Q_URL_VALIDATOR_EXPORT
!qdep_build: DEFINES += "Q_URL_VALIDATOR_EXPORT="
