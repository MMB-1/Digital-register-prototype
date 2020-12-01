#include "account.h"
#include "database.h"

#include <QSqlQueryModel>

Account::Account(QObject *parent)
: QSqlQueryModel(parent)
{
    this->updateModel();
    isLog=false;
}

QVariant Account::data(const QModelIndex &index, int role) const
{

    int columnId = role - Qt::UserRole -1;
    QModelIndex modelIndex = this->index(index.row(), columnId);
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

QHash<int,QByteArray> Account::roleNames() const{
    QHash<int,QByteArray> roles;
    roles[(int)Role::IdRole] = "id";
    roles[(int)Role::UNameRole] = "username";
    roles[(int)Role::UPasswordRole] = "userpassword";
    return roles;
}

int Account::getId(int row) const
{
    return this->data(this->index(row, 0), (int)Role::IdRole).toInt();
}

void Account::updateModel(){
    this->setQuery("SELECT id, " LOGIN_USER ", " LOGIN_PASSWORD " FROM " LOGIN);
}
bool Account::checkData(const QString &username, const QString &userpassword ){
    QSqlQuery query;
    int num;
    qDebug() << username;
    query.prepare("SELECT(SELECT COUNT(*) FROM " LOGIN " WHERE " LOGIN_USER "=:USERNAME AND " LOGIN_PASSWORD "=:USERPASSWORD) AS COUNT");
    query.bindValue(":USERNAME", username);
    query.bindValue(":USERPASSWORD", userpassword);
    query.exec();
    query.next();
    num = query.value(0).toInt();
    if(num == 1){
        isLog = true;
        return true;
    }
    else
        return false;
}
bool Account::checkData(const QString &username){
    QSqlQuery query;
    int num;
    qDebug() << username;
    query.prepare("SELECT(SELECT COUNT(*) FROM " LOGIN " WHERE " LOGIN_USER "=:USERNAME) AS COUNT");
    query.bindValue(":USERNAME", username);
    query.exec();
    query.next();
    num = query.value(0).toInt();
    if(num == 1)
        return true;
    else
        return false;
}
bool Account::isLogged(){
return isLog;
}

