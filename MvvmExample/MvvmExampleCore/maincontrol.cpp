#include "maincontrol.h"
#include <settingscontrol.h>

MainControl::MainControl(QObject *parent) :
	Control(parent),
	_text(QStringLiteral("baum42"))
{}

void MainControl::showSettings()
{
	auto settings = new SettingsControl(this);
	settings->setDeleteOnClose(true);
	settings->show();
}

QString MainControl::text() const
{
	return _text;
}

void MainControl::setText(QString text)
{
	if (_text == text)
			return;

	_text = text;
	emit textChanged(_text);
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
