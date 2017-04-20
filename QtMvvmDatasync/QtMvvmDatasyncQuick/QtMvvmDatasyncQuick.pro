TEMPLATE = app

QT += core gui qml quick quickcontrols2 widgets
CONFIG += c++11

TARGET = QtMvvmDatasyncQuick

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

DEFINES += QT_DEPRECATED_WARNINGS

QPM_INCLUDEPATH = $$PWD/../QtMvvmDatasyncCore/vendor/vendor.pri
include(vendor/vendor.pri)

SOURCES += main.cpp

RESOURCES += \
	qtmvvmdatasyncquick.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

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

DISTFILES += \
    android/AndroidManifest.xml \
    android/res/values/libs.xml \
    android/build.gradle

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
