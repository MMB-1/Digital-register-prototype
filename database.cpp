#include "database.h"
#include "studentmodel.h"
#include "studentlist.h"
#include <QSqlQueryModel>
#include <QSqlRecord>

DataBase::DataBase(QObject *parent) : QObject(parent)
{

}

DataBase::~DataBase()
{

}

void DataBase::connectToDataBase()
{
    if(!QFile("C:/example/" DATABASE_NAME).exists()){
        this->restoreDataBase();
    } else {
        this->openDataBase();
    }
}
bool DataBase::restoreDataBase()
{
    if(this->openDataBase()){
        return (this->createTable()) ? true : false;
    }
    else
    {
        qDebug() << "Failed to restore the database";
        return false;
    }
    return false;
}

bool DataBase::openDataBase()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName("C:/example/" DATABASE_NAME);
    if(db.open()){
        return true;
    } else {
        return false;
    }
}

void DataBase::closeDataBase()
{
    db.close();
}

bool DataBase::createTable()
{
    QSqlQuery query;
    if(!query.exec(  "CREATE TABLE " LOGIN " ("
                     "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                     LOGIN_USER    " VARCHAR(255)    NOT NULL,"
                     LOGIN_PASSWORD     " VARCHAR(255)    NOT NULL"
                 " )")){
        qDebug() << "DataBase: error of create " << LOGIN;
        qDebug() << query.lastError().text();
        return false;
    }
    else if(!query.exec("CREATE TABLE " TABLE " ("
                        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                        TABLE_FIRSTNAME     " VARCHAR(255)    NOT NULL,"
                        TABLE_LASTNAME     " VARCHAR(255)    NOT NULL,"
                        TABLE_PHONENUMBER       " VARCHAR(255)    NOT NULL,"
                        TABLE_ADDRESS            " VARCHAR(255),"
                        TABLE_DESCRIPTION       " VARCHAR(255),"
                        LOGIN_ID " INTEGER,"
                        "FOREIGN KEY (" LOGIN_ID ") REFERENCES " LOGIN "(id)"
                    " )") ){
                               qDebug() << "DataBase: error of create " << TABLE;
                               qDebug() << query.lastError().text();
                               return false;
    }
    else if(!query.exec("CREATE TABLE " CLASSES " ("
                        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                        CLASSES_NAME     " VARCHAR(255)    NOT NULL,"
                        LOGIN_ID " INTEGER,"
                        "FOREIGN KEY (" LOGIN_ID ") REFERENCES " LOGIN "(id)"
                        " )")){
        qDebug() << "DataBase: error of create " << CLASSES;
        qDebug() << query.lastError().text();
    }
    else{
        return true;
    }
    return false;
}

bool DataBase::inserIntoStudentTable(const QVariantList &data)
{
    QSqlQuery query;
    query.prepare("INSERT INTO " TABLE " ( " TABLE_FIRSTNAME ", "
                                             TABLE_LASTNAME ", "
                                             TABLE_PHONENUMBER", "
                                             LOGIN_ID   " ) "
                  "VALUES (:firstName, :lastName, :phoneNumber, :loginID)");
    query.bindValue(":firstName",       data[0].toString());
    query.bindValue(":lastName",       data[1].toString());
    query.bindValue(":phoneNumber",         data[2].toString());
    query.bindValue(":loginID",             data[3].toString());
    if(!query.exec()){
        qDebug() << "error insert into " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
bool DataBase::inserIntoLoginTable(const QVariantList &data){
    QSqlQuery query;
    query.prepare("INSERT INTO " LOGIN" ( " LOGIN_USER ", "
                                            LOGIN_PASSWORD" )"
                   "VALUES (:username, :userpassword)");
    query.bindValue(":username", data[0].toString());
    query.bindValue(":userpassword", data[1].toString());
    if(!query.exec()){
        qDebug() << "error insert into " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;

}

bool DataBase::inserIntoTable(const QString &firstName, const QString &lastName, const QString &phoneNumber,const int &loginID)
{
    QVariantList data;
    data.append(firstName);
    data.append(lastName);
    data.append(phoneNumber);
    data.append(loginID);

    if(inserIntoStudentTable(data))
        return true;
    else
        return false;
}
bool DataBase::inserIntoTable(const QString &username, const QString &userpassword){
    QVariantList data;
    data.append(username);
    data.append(userpassword);
    if(inserIntoLoginTable(data))
        return true;
    else
        return false;
}

bool DataBase::removeRecord(const int id)
{
    QSqlQuery query;

    query.prepare("DELETE FROM " TABLE " WHERE id= :ID ;");
    query.bindValue(":ID", id);

    if(!query.exec()){
        qDebug() << "error delete row " << TABLE;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
bool DataBase::dbIsEmpty(){
    int num;
    QSqlQuery query("SELECT(SELECT COUNT(*) FROM " TABLE") AS COUNT");
    query.next();
    num = query.value(0).toInt();
    qDebug() << num;
    if(num==0)
        return true;
    else
        return false;
}
