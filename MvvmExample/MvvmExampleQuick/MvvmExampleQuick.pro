TEMPLATE = app

QT += core gui qml quick quickcontrols2
CONFIG += c++11

TARGET = MvvmExampleQuick

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

DEFINES += QT_DEPRECATED_WARNINGS

QPM_INCLUDEPATH = $$PWD/../MvvmExampleCore/vendor/vendor.pri
include(vendor/vendor.pri)

SOURCES += main.cpp

RESOURCES += \
    mvvmexamplequick.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

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
