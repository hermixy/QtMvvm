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
	qDebug("MainControl gui is now visible");
	//logic to execute when the gui is shown
}

void MainControl::onClose()
{
	qDebug("MainControl gui is now closed");
	//logic to execute when the gui was closed
}
