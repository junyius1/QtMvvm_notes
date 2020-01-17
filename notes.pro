TEMPLATE = subdirs

SUBDIRS += \
	notesQuick \
	notesCore

SUBDIRS += \
        mvvmFrame \
        notesQuick \
        notesCore \

notesQuick.depends += notesCore
