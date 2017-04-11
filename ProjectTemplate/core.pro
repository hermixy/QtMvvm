TEMPLATE = lib

QT += core gui
CONFIG += c++11 staticlib #important because dlls are problematic

TARGET = %{CoreName}

DEFINES += QT_DEPRECATED_WARNINGS

include(vendor/vendor.pri)

HEADERS += \\
	%{AppHdrName} \\
	%{ControlHdrName}

SOURCES += \\
	%{AppSrcName} \\
	%{ControlSrcName}

@if '%{UseSettings}'
RESOURCES += \\
	%{AppQrcFile}

@endif