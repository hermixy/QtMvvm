#ifndef %{ControlGuard}
#define %{ControlGuard}

#include <control.h>

class %{ControlCn} : public Control
{
	Q_OBJECT

public:
	explicit %{ControlCn}(QObject *parent = nullptr);
	
	void onShow() override;
	void onClose() override;
@if '%{UseSettings}'

public slots:
	void showSettings();
@endif
};

#endif // %{ControlGuard}
