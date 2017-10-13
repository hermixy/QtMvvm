TEMPLATE = app

QT += core gui widgets
CONFIG += c++11

TARGET = QtMvvmDatasyncWidgets

DEFINES += QT_DEPRECATED_WARNINGS

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

QPMX_EXTRA_OPTIONS += --dev-cache ..
!ReleaseBuild:!DebugBuild:!system(qpmx -d $$shell_quote($$_PRO_FILE_PWD_) --qmake-run init $$QPMX_EXTRA_OPTIONS $$shell_quote($$QMAKE_QMAKE) $$shell_quote($$OUT_PWD)): error(qpmx initialization failed. Check the compilation log for details.)
else: include($$OUT_PWD/qpmx_generated.pri)
