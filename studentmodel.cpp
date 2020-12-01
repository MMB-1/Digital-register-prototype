#include "studentmodel.h"
#include "studentlist.h"
#include "student.h"
#include "database.h"


#include <QSqlQueryModel>

StudentModel::StudentModel(QObject *parent)
    : QSqlQueryModel(parent)
{
    this->updateModel();
}


QVariant StudentModel::data(const QModelIndex& index, int role) const
{
    if(role == (int)Role::checkedRole)
    {
        return QVariant(isChecked(index.row()));
    }

    int columnId = role - Qt::UserRole;
    QModelIndex modelIndex = this->index(index.row(), columnId);
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}

bool StudentModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(role == (int)Role::checkedRole)
    {
        if(value.toBool() && !isChecked(index.row()))
        {
            check(index.row());
            emit dataChanged(index, index, QVector<int>() << role);
            return true;
        }
        else if(isChecked(index.row()))
        {
            uncheck(index.row());
            emit dataChanged(index, index, QVector<int>() << role);
            return true;
        }
    }
    return false;
}

QHash<int,QByteArray> StudentModel::roleNames() const{
    QHash<int,QByteArray> roles;
    roles[(int)Role::IdRole] = "id";
    roles[(int)Role::FNameRole] = "fname";
    roles[(int)Role::LNameRole] = "lname";
    roles[(int)Role::PhoneRole] = "phone";
    roles[(int)Role::checkedRole] = "checkedRole";
    return roles;
}



void StudentModel::updateModel()
{

 this->setQuery("SELECT id, " TABLE_FIRSTNAME ", " TABLE_LASTNAME ", " TABLE_PHONENUMBER " FROM " TABLE);
}

int StudentModel::getId(int row) const
{
    return this->data(this->index(row, 0), (int)Role::IdRole).toInt();
}


void StudentModel::uncheckAll()
{
    beginResetModel();
    checkedDebug();
    checked.clear();
    checkedDebug();
    endResetModel();
    //emit dataChanged(this->index(0, 0), this->index(this->rowCount(), columnCount()), QVector<int>() << (int)Role::checkedRole);
}
/*
void StudentModel::checkAll()
{
    for(auto& i : mList->items())
    {
        checked.append(i.ID());
    }
    emit dataChanged(this->index(0), this->index(mList->items().length()-1), QVector<int>() << (int)Role::checkedRole);
}
*/
bool StudentModel::isChecked(int index) const
{
    checkedDebug();
    int id = this->getId(index);
    return checked.contains(id);
}
void StudentModel::check(int index)
{
    int id = this->getId(index);
    checked.append(id);
    checkedDebug();
}
void StudentModel::uncheck(int index)
{
    int id = this->getId(index);
    for(int i = 0; i < checked.length(); i++)
    {
        if(checked[i] == id)
        {
            checked.remove(i);
            break;
        }
    }
    checkedDebug();
}

void StudentModel::checkedDebug() const
{
    QString str = "Length: ";
    str += QString::number(checked.length());
    str += " IDs = ";
    for(auto& i : checked)
    {
        str += QString::number(i);
        str += ", ";
    }
    qDebug() << str;
}

