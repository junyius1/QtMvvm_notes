
QEXCEPTIONBASE_HEADERS = \
	$$PWD/qexceptionbase.h

QEXCEPTIONBASE_SOURCES = \
	$$PWD/qexceptionbase.cpp

DISTFILES += \
	$$PWD/generate.py

isEmpty(QEXCEPTIONBASE_NAMESPACE): QEXCEPTIONBASE_NAMESPACE = $$TARGET

isEmpty(QEXCEPTIONBASE_GENERATE_SCRIPT): QEXCEPTIONBASE_GENERATE_SCRIPT = $$PWD/generate.py
win32: QEXCEPTIONBASE_GENERATE = python $$QEXCEPTIONBASE_GENERATE_SCRIPT
else: QEXCEPTIONBASE_GENERATE = $$QEXCEPTIONBASE_GENERATE_SCRIPT

isEmpty(QEXCEPTIONBASE_GENDIR) {
	qexceptionbase_src_build: QEXCEPTIONBASE_GENDIR = $$_PRO_FILE_PWD_/qexceptionbase
	else: QEXCEPTIONBASE_GENDIR = $$OUT_PWD/qexceptionbase
	debug_and_release {
		CONFIG(debug, debug|release): QEXCEPTIONBASE_GENDIR = $$QEXCEPTIONBASE_GENDIR/debug
		CONFIG(release, debug|release): QEXCEPTIONBASE_GENDIR = $$QEXCEPTIONBASE_GENDIR/release
	}
}

qexceptionbase_hdr_c.name = QEXCEPTIONBASE_GENERATE header ${QMAKE_FILE_IN}.h
qexceptionbase_hdr_c.input = QEXCEPTIONBASE_HEADERS
qexceptionbase_hdr_c.variable_out = HEADERS
qexceptionbase_hdr_c.commands = $$QEXCEPTIONBASE_GENERATE --hdr ${QMAKE_FILE_IN} ${QMAKE_FILE_OUT} $$QEXCEPTIONBASE_NAMESPACE $$QEXCEPTIONBASE_EXPORT
qexceptionbase_hdr_c.output = $$QEXCEPTIONBASE_GENDIR/${QMAKE_FILE_BASE}.h
qexceptionbase_hdr_c.depends += $$QEXCEPTIONBASE_GENERATE_SCRIPT
QMAKE_EXTRA_COMPILERS += qexceptionbase_hdr_c

qexceptionbase_src_c.name = QEXCEPTIONBASE_GENERATE source ${QMAKE_FILE_IN}.cpp
qexceptionbase_src_c.input = QEXCEPTIONBASE_SOURCES
qexceptionbase_src_c.variable_out = GENERATED_SOURCES
qexceptionbase_src_c.commands = $$QEXCEPTIONBASE_GENERATE --src ${QMAKE_FILE_IN} ${QMAKE_FILE_OUT} $$QEXCEPTIONBASE_NAMESPACE
qexceptionbase_src_c.output = $$QEXCEPTIONBASE_GENDIR/${QMAKE_FILE_BASE}.cpp
qexceptionbase_src_c.depends += $$QEXCEPTIONBASE_GENERATE_SCRIPT
QMAKE_EXTRA_COMPILERS += qexceptionbase_src_c

INCLUDEPATH += $$QEXCEPTIONBASE_GENDIR
