#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(Control *mControl, QWidget *parent) :
	QMainWindow(parent),
	control(static_cast<MainControl*>(mControl)),
	ui(new Ui::MainWindow)
{
	ui->setupUi(this);

	connect(ui->actionSettings, &QAction::triggered,
			control, &MainControl::showSettings);
}

MainWindow::~MainWindow()
{
	delete ui;
}
