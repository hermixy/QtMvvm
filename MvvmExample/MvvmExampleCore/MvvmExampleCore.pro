TEMPLATE = lib

QT += core gui
CONFIG += c++11 staticlib #important because dlls are problematic

TARGET = MvvmExampleCore

DEFINES += QT_DEPRECATED_WARNINGS

include(vendor/vendor.pri)

HEADERS += mvvmexamplecore.h

SOURCES += mvvmexamplecore.cpp
