#include <QApplication>
#include <widgetpresenter.h>
#include <qtmvvmdatasyncapp.h>
#include <datasyncdialog.h>

#include "mainwindow.h"

//register the core app to be used
REGISTER_CORE_APP(QtMvvmDatasyncApp)

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);

	// automatically sets "WidgetPresenter" as presenter and registers the %{WindowName} class as a widget
	// the control this widget belongs to is detected automatically via naming conventions
	WidgetPresenter::registerWidget<MainWindow>();
	DatasyncDialog::registerWidgets();

	return a.exec();
}
