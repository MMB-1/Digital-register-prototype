#ifndef ACCOUNT_H
#define ACCOUNT_H

#include <QSqlQueryModel>
#include <QObject>

class Account : public QSqlQueryModel
{
    Q_OBJECT



   public:
    explicit Account(QObject* parent = 0);

    enum class Role{
        IdRole = Qt::UserRole,
        UNameRole,
        UPasswordRole
    };
     bool isLog;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
protected:
     QHash<int, QByteArray> roleNames() const override;
public slots:
   //  void changeUserName(int index, QString &username);
    // void changePassword(int index);
     void updateModel();
     int getId(int row) const;
   bool checkData(const QString &username, const QString &userpassword);
   bool checkData(const QString &username);
   bool isLogged();

};

#endif // ACCOUNT_H
