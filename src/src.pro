TEMPLATE = subdirs

SUBDIRS += mvvmcore \
        mvvmquick \
        imports

mvvmquick.depends += mvvmcore
imports.depends += mvvmquick
#imports.CONFIG += no_lrelease_target

#prepareRecursiveTarget(lrelease)
QMAKE_EXTRA_TARGETS += lrelease
QMAKE_EXTRA_TARGETS += run-tests
