#include "qtmvvmdatasyncapp.h"
#include <setup.h>
#include <wsauthenticator.h>

QtMvvmDatasyncApp::QtMvvmDatasyncApp(QObject *parent) :
	CoreApp(parent),
	mainControl(nullptr)
{
	qRegisterMetaType<SampleData*>();
}

void QtMvvmDatasyncApp::setupParser(QCommandLineParser &parser, bool &allowInvalid) const
{
	CoreApp::setupParser(parser, allowInvalid);
	//add additional command line arguments etc here
}

bool QtMvvmDatasyncApp::startApp(const QCommandLineParser &parser)
{
	//shows help or version automatically
	if(autoShowHelpOrVersion(parser))
		return true;

	//use this method to create services, controls, etc
	QtDataSync::Setup().create();
	auto auth = QtDataSync::Setup::authenticatorForSetup<QtDataSync::WsAuthenticator>(this);
	auth->setRemoteUrl(QStringLiteral("ws://localhost:8080"));
	auth->setServerSecret("baum42");
	auth->reconnect();
	auth->deleteLater();

	//create and show the inital control
	mainControl = new MainControl(this);
	showControl(mainControl);

	return true;
}

void QtMvvmDatasyncApp::aboutToQuit()
{
	//if you need to perform any cleanups, do it here
}
