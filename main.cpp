#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QQmlContext>
#include <QtQml>
#include "Backend.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN) && QT_VERSION_CHECK(5, 6, 0) <= QT_VERSION && QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon(":/qt/qml/offbeat/images/OFFBEAT_Logo1.png"));


    QQmlApplicationEngine engine;

    Backend backend;
    qmlRegisterSingletonInstance("CustomClass", 1, 0, "Backend", &backend);
    // qml: import CustomClass 1.0
    // use: Backend.callFunctionsFromBackend.h(~args i guess lol~)

    engine.load(QUrl(QStringLiteral("qrc:/qt/qml/offbeat/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec(); 
    // This is gonna be a long development time... i'm gonna stick this project i think 
    // Cuz im Awesome:3
}
