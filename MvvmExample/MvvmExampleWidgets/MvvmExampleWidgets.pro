#-------------------------------------------------
#
# Project created by QtCreator 2017-04-10T19:56:02
#
#-------------------------------------------------

QT       += core gui widgets

TARGET = MvvmExampleWidgets
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS

include(vendor/vendor.pri)

HEADERS  += mainwindow.h

SOURCES += main.cpp\
		mainwindow.cpp

FORMS    += mainwindow.ui

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
