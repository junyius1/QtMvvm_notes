TEMPLATE = subdirs

QT += sql

SUBDIRS += \
        notesCore \
        notesQuick \
        src

notesQuick.depends += notesCore src

DISTFILES += .qmake.conf \
        sync.profile
