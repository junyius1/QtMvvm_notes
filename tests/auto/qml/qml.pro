TEMPLATE = subdirs

SUBDIRS += \
	qmlmvvmcore


prepareRecursiveTarget(run-tests)
QMAKE_EXTRA_TARGETS += run-tests
