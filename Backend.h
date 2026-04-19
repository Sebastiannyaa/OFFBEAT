#pragma once
#include <QObject>
#include <QDebug>
#include <QVariant>

class Backend : public QObject {
    Q_OBJECT
public:
    explicit Backend(QObject* parent = nullptr);

    // Test Functions, dont use
    Q_INVOKABLE void sayHello();
    Q_INVOKABLE int add(int a, int b);

    // Functions

    Q_INVOKABLE void close_app_task();

    Q_INVOKABLE int getValueExistingMusicFolder();
    
    Q_INVOKABLE void createMusicVaultFolder();

    Q_INVOKABLE void setConfValue(const QString& key, const QVariant& value);

    Q_INVOKABLE QVariant getConfValue(const QString& key, const QVariant& value);

};