TEMPLATE = lib

QT += core gui
CONFIG += c++11 staticlib #important because dlls are problematic

TARGET = QtMvvmDatasyncCore

DEFINES += QT_DEPRECATED_WARNINGS

include(vendor/vendor.pri)

HEADERS += \
	qtmvvmdatasyncapp.h \
	maincontrol.h

SOURCES += \
	qtmvvmdatasyncapp.cpp \
	maincontrol.cpp
