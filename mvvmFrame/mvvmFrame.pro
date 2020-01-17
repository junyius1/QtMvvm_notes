TEMPLATE = subdirs

SUBDIRS += mvvmcore \
        mvvmquick

mvvmwidgets.depends += mvvmcore
#imports.CONFIG += no_lrelease_target

#prepareRecursiveTarget(lrelease)
QMAKE_EXTRA_TARGETS += lrelease
QMAKE_EXTRA_TARGETS += run-tests
