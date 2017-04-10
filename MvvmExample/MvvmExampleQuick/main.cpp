#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <quickpresenter.h>
#include <mvvmexampleapp.h>

REGISTER_CORE_APP(MvvmExampleApp)

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication app(argc, argv);

	qmlRegisterUncreatableType<MainControl>("com.example.mvvmexample", 1, 0, "MainControl", "Controls cannot be created!");

	QuickPresenter::createAppEngine(QUrl(QLatin1String("qrc:/qml/App.qml")));

	return app.exec();
}
