TEMPLATE = subdirs

SUBDIRS += \
	notesQuick \
	notesCore

notesQuick.depends += notesCore
