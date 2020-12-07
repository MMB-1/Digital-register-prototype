#ifndef ACCOUNT_H
#define ACCOUNT_H

#include <QSqlQueryModel>
#include <QObject>

class Account : public QSqlQueryModel
{
    Q_OBJECT
    Q_PROPERTY(int loggedId READ loggedId WRITE login NOTIFY loginChanged)

   public:
    explicit Account(QObject* parent = 0);

    enum class Role{
        IdRole = Qt::UserRole,
        UNameRole,
        UPasswordRole
    };
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
   //virtual bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
protected:
     QHash<int, QByteArray> roleNames() const override;
public slots:
   //  void changeUserName(int index, QString &username);
    // void changePassword(int index);
     void updateModel();
     int getId(const QString &username);
   bool checkData(const QString &username, const QString &userpassword);
   bool checkData(const QString &username);
   void login(int index);
   int loggedId(){
       return m_loggedId;
   };
   bool statusLogged(){return m_statusLogged;};
signals:
    void loginChanged(int);
private:
   int m_loggedId = -1;
   bool m_statusLogged = false;
};

#endif // ACCOUNT_H
