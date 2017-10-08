TEMPLATE = subdirs

SUBDIRS += \
	QtMvvmDatasyncWidgets \
	#QtMvvmDatasyncQuick \
	QtMvvmDatasyncCore

QtMvvmDatasyncWidgets.depends += QtMvvmDatasyncCore
QtMvvmDatasyncQuick.depends += QtMvvmDatasyncCore
