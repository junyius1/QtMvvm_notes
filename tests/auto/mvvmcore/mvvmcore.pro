TEMPLATE = subdirs

SUBDIRS += \
	serviceregistry \
	serviceregistrytestplugin \
	binding \
	coreapp

serviceregistry.depends += serviceregistrytestplugin


prepareRecursiveTarget(run-tests)
QMAKE_EXTRA_TARGETS += run-tests
