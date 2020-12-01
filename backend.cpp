#include "backend.h"

BackEnd::BackEnd(QObject* parent)
    :QObject(parent) {}

QString BackEnd::Przywitanie()
{
    return m_przywitanie;
}

QString BackEnd::userName()
{
    return m_userName;
}

void BackEnd::setPrzywitanie(const QString& Przywitanie)
{
    if(Przywitanie == m_przywitanie)
        return;

    m_przywitanie = Przywitanie;
    emit PrzywitanieChanged();
}

void BackEnd::setUserName(const QString& userName)
{
    if (userName == m_userName)
        return;

    m_userName = userName;
    emit userNameChanged();
}
