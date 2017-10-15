TEMPLATE = lib

QT += core gui
CONFIG += c++11 staticlib #important because dlls are problematic

TARGET = MvvmExampleCore

DEFINES += QT_DEPRECATED_WARNINGS

HEADERS += \
	mvvmexampleapp.h \
	maincontrol.h

SOURCES += \
	mvvmexampleapp.cpp \
	maincontrol.cpp

RESOURCES += \
	mvvmexamplecore.qrc

TRANSLATIONS += mvvmexample_core_de.ts \
	mvvmexample_core_template.ts

QTMVVM_SETTINGS_FILES = settings.xml
never_true_lupdate_only: SOURCES += .qtmvvm_settings_xml_ts.cppdummy
CONFIG += no_settings_ts_warn

!ReleaseBuild:!DebugBuild:!system(qpmx -d $$shell_quote($$_PRO_FILE_PWD_) --qmake-run init $$QPMX_EXTRA_OPTIONS $$shell_quote($$QMAKE_QMAKE) $$shell_quote($$OUT_PWD)): error(qpmx initialization failed. Check the compilation log for details.)
else: include($$OUT_PWD/qpmx_generated.pri)
