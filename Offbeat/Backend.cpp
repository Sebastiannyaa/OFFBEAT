#include "Backend.h"
#include <QCoreApplication>
#include <QDir>
#include <QDebug>
#include <QSettings>
#include <QVariant>



// Private functions
bool createFolder(const QString& fullPath)
{
    return QDir().mkpath(fullPath);
}







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




void Backend::createMusicVaultFolder()
{
    QString base = QCoreApplication::applicationDirPath() + "/offbeat_music_folder";

    QDir dir;

    // check only once
    if (!dir.exists(base))
    {
        dir.mkpath(base);
    }

    // Create Folders
    createFolder(base + "/Playlists");
    createFolder(base + "/Themes");
    createFolder(base + "/ImportedSongs");


    // Create all files
    QString configPath = base + "/config.ini";
    {
        QSettings settings(configPath, QSettings::IniFormat);

        setConfValue("ValutOpen/boolean", false);

        settings.setValue("audio/volume", 80);
        settings.setValue("audio/muted", false);
        

    }

}
QString ConfigFile_path = QCoreApplication::applicationDirPath() + "/offbeat_music_folder/config.ini";
QSettings settings(ConfigFile_path, QSettings::IniFormat);



void Backend::setConfValue(const QString& key, const QVariant& value) {
    QString configPath = QCoreApplication::applicationDirPath()
        + "/offbeat_music_folder/config.ini";

    QSettings settings(configPath, QSettings::IniFormat);
    settings.setValue(key, value);
}


QVariant Backend::getConfValue(const QString& key, const QVariant& defaultValue)
{
    QString configPath = QCoreApplication::applicationDirPath()
        + "/offbeat_music_folder/config.ini";

    QSettings settings(configPath, QSettings::IniFormat);
    return settings.value(key, defaultValue);
}