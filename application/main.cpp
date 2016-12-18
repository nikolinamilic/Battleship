#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>
#include <model/eventhandler.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    EventHandler eh;

    //engine.load(QUrl(QStringLiteral("qrc:/qml/Welcome.qml")));
    engine.rootContext()->setContextProperty("eventHandler", &eh);

    return app.exec();
}
