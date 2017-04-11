#ifndef MAINCONTROL_H
#define MAINCONTROL_H

#include <control.h>

class MainControl : public Control
{
	Q_OBJECT

public:
	explicit MainControl(QObject *parent = nullptr);

	void onShow() override;
	void onClose() override;

public slots:
	void showSettings();
};

#endif // MAINCONTROL_H
