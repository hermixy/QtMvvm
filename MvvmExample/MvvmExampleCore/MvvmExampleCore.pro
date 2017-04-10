TEMPLATE = lib

QT += core gui
CONFIG += staticlib #important because dlls are problematic

TARGET = MvvmExampleCore

DEFINES += QT_DEPRECATED_WARNINGS

include(vendor/vendor.pri)

HEADERS += \
	mvvmexampleapp.h \
	maincontrol.h

SOURCES += \
	mvvmexampleapp.cpp \
	maincontrol.cpp

RESOURCES += \
	mvvmexamplecore.qrc
