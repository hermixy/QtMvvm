#include <QApplication>
#include <QQmlApplicationEngine>
#include <quickpresenter.h>
#include <qtmvvmdatasyncapp.h>

REGISTER_CORE_APP(QtMvvmDatasyncApp)

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QApplication app(argc, argv);

	qmlRegisterUncreatableType<MainControl>("com.example.qtmvvmdatasync", 1, 0, "MainControl", "Controls cannot be created!");

	QuickPresenter::createAppEngine(QUrl(QLatin1String("qrc:/qml/App.qml")));

	return app.exec();
}
