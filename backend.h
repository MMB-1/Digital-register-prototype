#pragma once

#include <QObject>
#include <QString>
#include <qqml.h>

class BackEnd : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString Przywitanie READ Przywitanie WRITE setPrzywitanie NOTIFY PrzywitanieChanged)
    QML_ELEMENT

public:
    explicit BackEnd(QObject* parent = nullptr);

    QString Przywitanie();
    void setPrzywitanie(const QString& Przywitanie);
    QString userName();
    void setUserName(const QString& userName);

signals:
    void userNameChanged();
    void PrzywitanieChanged();

private:
    QString m_userName;
    QString m_przywitanie;
};

