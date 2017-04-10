TEMPLATE = subdirs

SUBDIRS += \
	MvvmExampleCore \
	MvvmExampleWidgets \
	MvvmExampleQuick

MvvmExampleWidgets.depends += MvvmExampleCore
MvvmExampleQuick.depends += MvvmExampleCore
