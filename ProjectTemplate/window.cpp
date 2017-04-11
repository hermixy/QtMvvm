#include "%{WindowHdrName}"
#include "ui_%{WindowHdrName}"

%{WindowCn}::%{WindowCn}(Control *mControl, QWidget *parent) :
	QMainWindow(parent),
	control(static_cast<%{ControlCn}*>(mControl)),
	ui(new Ui::%{WindowCn})
{
	ui->setupUi(this);
@if '%{UseSettings}'

	connect(ui->actionSettings, &QAction::triggered,
			control, &%{ControlCn}::showSettings);
@endif
}

%{WindowCn}::~%{WindowCn}()
{
	delete ui;
}
