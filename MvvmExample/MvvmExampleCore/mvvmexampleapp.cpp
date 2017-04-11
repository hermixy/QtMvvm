#include "mvvmexampleapp.h"

MvvmExampleApp::MvvmExampleApp(QObject *parent) :
	CoreApp(parent),
	mainControl(nullptr)
{
	//register metatypes etc here, just like you would do in your main before call QCoreApplication::exec

	//if you are using a qt resource (e.g. "mvvmexamplecore.qrc"), initialize it here
	Q_INIT_RESOURCE(mvvmexamplecore);
}

void MvvmExampleApp::setupParser(QCommandLineParser &parser, bool &allowInvalid) const
{
	CoreApp::setupParser(parser, allowInvalid);
	//add additional command line arguments etc here
}

bool MvvmExampleApp::startApp(const QCommandLineParser &parser)
{
	//shows help or version automatically
	if(autoShowHelpOrVersion(parser))
		return true;

	//use this method to create services, controls, etc

	//create and show the inital control
	mainControl = new MainControl(this);
	showControl(mainControl);

	return true;
}

void MvvmExampleApp::aboutToQuit()
{
	//if you need to perform any cleanups, do it here
}
