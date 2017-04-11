#include "maincontrol.h"
#include <settingscontrol.h>

MainControl::MainControl(QObject *parent) :
	Control(parent)
{}

void MainControl::showSettings()
{
	auto settings = new SettingsControl(this);
	settings->setDeleteOnClose(true);
	settings->show();
}

void MainControl::onShow()
{
	qDebug("Main gui is now visible");
	//logic to execute when the gui is shown
}

void MainControl::onClose()
{
	qDebug("Main gui is now closed");
	//logic to execute when the gui was closed
}
