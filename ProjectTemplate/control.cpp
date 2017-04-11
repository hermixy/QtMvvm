#include "%{ControlHdrName}"
@if '%{UseSettings}'
#include <settingscontrol.h>
@endif

%{ControlCn}::%{ControlCn}(QObject *parent) :
	Control(parent)
{}

@if '%{UseSettings}'
void %{ControlCn}::showSettings()
{
	auto settings = new SettingsControl(this);
	settings->setDeleteOnClose(true);
	settings->show();
}

@endif
void %{ControlCn}::onShow()
{
	qDebug("%{ControlName} gui is now visible");
	//logic to execute when the gui is shown
}

void %{ControlCn}::onClose()
{
	qDebug("%{ControlName} gui is now closed");
	//logic to execute when the gui was closed
}
