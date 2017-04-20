TEMPLATE = app

QT += core gui widgets
CONFIG += c++11

TARGET = QtMvvmDatasyncWidgets

DEFINES += QT_DEPRECATED_WARNINGS

QPM_INCLUDEPATH = $$PWD/../QtMvvmDatasyncCore/vendor/vendor.pri
include(vendor/vendor.pri)

HEADERS += mainwindow.h

SOURCES += main.cpp \
	mainwindow.cpp

FORMS += mainwindow.ui

# Link with core project
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../QtMvvmDatasyncCore/release/ -lQtMvvmDatasyncCore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../QtMvvmDatasyncCore/debug/ -lQtMvvmDatasyncCore
else:unix: LIBS += -L$$OUT_PWD/../QtMvvmDatasyncCore/ -lQtMvvmDatasyncCore

INCLUDEPATH += $$PWD/../QtMvvmDatasyncCore
DEPENDPATH += $$PWD/../QtMvvmDatasyncCore

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../QtMvvmDatasyncCore/release/libQtMvvmDatasyncCore.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../QtMvvmDatasyncCore/debug/libQtMvvmDatasyncCore.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../QtMvvmDatasyncCore/release/QtMvvmDatasyncCore.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../QtMvvmDatasyncCore/debug/QtMvvmDatasyncCore.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../QtMvvmDatasyncCore/libQtMvvmDatasyncCore.a
