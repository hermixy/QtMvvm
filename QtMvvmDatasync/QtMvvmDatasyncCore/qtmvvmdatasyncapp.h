#ifndef QTMVVMDATASYNCAPP_H
#define QTMVVMDATASYNCAPP_H

#include <coreapp.h>

#include "maincontrol.h"

class SampleData : public QObject
{
	Q_OBJECT
};

class QtMvvmDatasyncApp : public CoreApp
{
	Q_OBJECT

public:
	explicit QtMvvmDatasyncApp(QObject *parent = nullptr);

protected:
	void setupParser(QCommandLineParser &parser, bool &allowInvalid) const override;
	bool startApp(const QCommandLineParser &parser) override;

protected slots:
	void aboutToQuit() override;

private:
	MainControl *mainControl;
};

#undef coreApp
#define coreApp static_cast<QtMvvmDatasyncApp*>(CoreApp::instance())

#endif // QTMVVMDATASYNCAPP_H
