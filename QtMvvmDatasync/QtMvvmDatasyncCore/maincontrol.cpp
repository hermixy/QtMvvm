#include "maincontrol.h"
#include <datasynccontrol.h>

MainControl::MainControl(QObject *parent) :
	Control(parent)
{}

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

void MainControl::showDataSync()
{
	auto control = new DatasyncControl(this);
	control->setDeleteOnClose(true);
	control->show();
}
