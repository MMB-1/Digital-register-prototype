#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>

#define DATABASE_HOSTNAME   "NameDataBase"
#define DATABASE_NAME       "Name.db"

#define TABLE                   "informacje"
#define TABLE_FIRSTNAME             "firstName"
#define TABLE_LASTNAME               "lastName"
#define TABLE_PHONENUMBER              "phoneNumber"

#define LOGIN                      "login"
#define LOGIN_USER                 "username"
#define LOGIN_PASSWORD             "userpassword"

class DataBase : public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();
    void connectToDataBase();


private:
    QSqlDatabase    db;

private:
    bool openDataBase();
    bool restoreDataBase();
    void closeDataBase();
    bool createTable();


public slots:
    bool inserIntoStudentTable(const QVariantList &data);      // Adding entries to the table
    bool inserIntoLoginTable(const QVariantList &data);
    bool inserIntoTable(const QString &firstName, const QString &lastName, const QString &phoneNumber);
    bool inserIntoTable(const QString &username, const QString &userpassword);
    bool removeRecord(const int id); // Removing records from the table on its id
    bool  dbIsEmpty();
};

#endif // DATABASE_H
