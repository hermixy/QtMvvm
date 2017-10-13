TEMPLATE = lib

QT += core gui
CONFIG += c++11 staticlib #important because dlls are problematic

TARGET = QtMvvmDatasyncCore

DEFINES += QT_DEPRECATED_WARNINGS

HEADERS += \
	qtmvvmdatasyncapp.h \
	maincontrol.h

SOURCES += \
	qtmvvmdatasyncapp.cpp \
	maincontrol.cpp

QPMX_EXTRA_OPTIONS += --dev-cache ..
!ReleaseBuild:!DebugBuild:!system(qpmx -d $$shell_quote($$_PRO_FILE_PWD_) --qmake-run init $$QPMX_EXTRA_OPTIONS $$shell_quote($$QMAKE_QMAKE) $$shell_quote($$OUT_PWD)): error(qpmx initialization failed. Check the compilation log for details.)
else: include($$OUT_PWD/qpmx_generated.pri)
