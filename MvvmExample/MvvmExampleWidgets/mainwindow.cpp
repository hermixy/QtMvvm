#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(Control *mControl, QWidget *parent) :
	QMainWindow(parent),
	control(static_cast<MainControl*>(mControl)),
	ui(new Ui::MainWindow)
{
	ui->setupUi(this);
}


MainWindow::~MainWindow()
{
	delete ui;
}
