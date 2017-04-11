TEMPLATE = subdirs

SUBDIRS += \
	MvvmExampleWidgets \
	MvvmExampleQuick \
	MvvmExampleCore

MvvmExampleWidgets.depends += MvvmExampleCore
MvvmExampleQuick.depends += MvvmExampleCore
