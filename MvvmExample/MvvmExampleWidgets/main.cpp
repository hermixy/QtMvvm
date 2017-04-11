#include "mainwindow.h"
#include <QApplication>
#include <widgetpresenter.h>
#include <mvvmexampleapp.h>
#include <settingsdialog.h>

//register the core app to be used
REGISTER_CORE_APP(MvvmExampleApp)

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);

	// automatically sets "WidgetPresenter" as presenter and registers the MainWindow class as a widget
	// the control this widget belongs to is detected automatically via naming conventions
	WidgetPresenter::registerWidget<MainWindow>();
	WidgetPresenter::registerWidget<SettingsDialog>();

	return a.exec();
}
