#include "Backend.h"
#include <QCoreApplication>
#include <QDir>
#include <QDebug>

Backend::Backend(QObject* parent)
    : QObject(parent)
{
}

// Test Functions, dont use
void Backend::sayHello() {
    qDebug() << "Hello from C++!";
    QString exePath = QCoreApplication::applicationFilePath();
    qDebug() << exePath;
}
int Backend::add(int a, int b) {
    return a + b;
}




// Functions






void Backend::close_app_task() {
    QCoreApplication::quit();
}


int Backend::getValueExistingMusicFolder() {
    QString path = QCoreApplication::applicationDirPath();

    QDir dir(path + "/offbeat_music_folder");

    if (dir.exists()) {
        return 1;
    }

    return 0;
}
