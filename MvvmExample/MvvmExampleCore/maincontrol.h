#ifndef MAINCONTROL_H
#define MAINCONTROL_H

#include <control.h>

class MainControl : public Control
{
	Q_OBJECT

public:
	explicit MainControl(QObject *parent = nullptr);

public slots:
	void showSettings();

public:
	void onShow() override;
	void onClose() override;
};

#endif // MAINCONTROL_H
