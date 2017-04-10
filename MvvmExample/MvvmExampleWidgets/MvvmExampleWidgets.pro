TEMPLATE = app

QT       += core gui widgets
CONFIG += c++11

TARGET = MvvmExampleWidgets

DEFINES += QT_DEPRECATED_WARNINGS

QPM_INCLUDEPATH = $$PWD/../MvvmExampleCore/vendor/vendor.pri
include(vendor/vendor.pri)

HEADERS  += mainwindow.h

SOURCES += main.cpp\
		mainwindow.cpp

FORMS    += mainwindow.ui

# Link with core project
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../MvvmExampleCore/release/ -lMvvmExampleCore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../MvvmExampleCore/debug/ -lMvvmExampleCore
else:unix: LIBS += -L$$OUT_PWD/../MvvmExampleCore/ -lMvvmExampleCore

INCLUDEPATH += $$PWD/../MvvmExampleCore
DEPENDPATH += $$PWD/../MvvmExampleCore

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../MvvmExampleCore/release/libMvvmExampleCore.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../MvvmExampleCore/debug/libMvvmExampleCore.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../MvvmExampleCore/release/MvvmExampleCore.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../MvvmExampleCore/debug/MvvmExampleCore.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../MvvmExampleCore/libMvvmExampleCore.a
