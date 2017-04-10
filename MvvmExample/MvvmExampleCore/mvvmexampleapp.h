#ifndef MVVMEXAMPLEAPP_H
#define MVVMEXAMPLEAPP_H

#include <coreapp.h>

#include "maincontrol.h"

class MvvmExampleApp : public CoreApp
{
	Q_OBJECT

public:
	explicit MvvmExampleApp(QObject *parent = nullptr);

protected:
	void setupParser(QCommandLineParser &parser, bool &allowInvalid) const override;
	bool startApp(const QCommandLineParser &parser) override;

protected slots:
	void aboutToQuit() override;

private:
	MainControl *mainControl;
};

#undef coreApp
#define coreApp static_cast<MvvmExampleApp*>(CoreApp::instance())

#endif // MVVMEXAMPLEAPP_H
