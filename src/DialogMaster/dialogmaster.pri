HEADERS += \
	$$PWD/dialogmaster.h

SOURCES += \
	$$PWD/dialogmaster.cpp

INCLUDEPATH += $$PWD

QDEP_TRANSLATIONS += \
	$$PWD/dialogmaster_de.ts \
	$$PWD/dialogmaster_template.ts

!qdep_build: EXTRA_TRANSLATIONS += $$QDEP_TRANSLATIONS

QDEP_PACKAGE_EXPORTS += Q_DIALOG_MASTER_EXPORT
!qdep_build: DEFINES += "Q_DIALOG_MASTER_EXPORT="
