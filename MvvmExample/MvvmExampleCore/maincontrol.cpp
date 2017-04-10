#include "maincontrol.h"

MainControl::MainControl(QObject *parent) :
	Control(parent)
{}

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
