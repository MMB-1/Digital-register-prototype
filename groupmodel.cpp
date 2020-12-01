#include "groupmodel.h"
#include "grouplist.h"
#include "group.h"

GroupModel::GroupModel(QObject *parent)
    : QAbstractListModel(parent)
    , mList(nullptr)
{
}

int GroupModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid() || !mList)
        return 0;

    // FIXME: Implement me!
    return mList->items().size();
}

QVariant GroupModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !mList)
        return QVariant();

    const Group& group = mList->items().at(index.row());
    switch (role)
    {
    case (int)Role::IdRole:
        return QVariant(group.ID());
    case (int)Role::nameRole:
        return QVariant(group.groupName);
    }
    return QVariant();
}

bool GroupModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!mList)
        return false;

    Group group(mList->items().at(index.row()));
    switch (role)
    {
    case (int)Role::nameRole:
        group.groupName = value.toString();
        break;
    }
    if (mList->setItemAt(index.row(), group))
    {
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags GroupModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable; // FIXME: Implement me!
}

QHash<int, QByteArray> GroupModel::roleNames() const
{
    QHash<int,QByteArray> names;
    names[(int)Role::IdRole] = "id";
    names[(int)Role::nameRole] = "groupName";
    return names;
}

GroupList *GroupModel::list() const
{
    return mList;
}

void GroupModel::setList(GroupList *list)
{
    beginResetModel();

    if(mList)
        mList->disconnect(this);

    mList = list;

    if(mList)
    {
        connect(mList, &GroupList::preItemAppended, this, [=]()
        {
            const int index = mList->items().size();
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(mList, &GroupList::postItemAppended, this, [=]()
        {
            endInsertRows();
        });
        connect(mList, &GroupList::preItemRemoved, this, [=](int index)
        {
            beginRemoveRows(QModelIndex(), index, index);
        });
        connect(mList, &GroupList::postItemRemoved, this, [=]()
        {
            endRemoveRows();
        });
    }
    endResetModel();
}
/*
bool GroupModel::insertRows(int row, int count, const QModelIndex &parent)
{
    beginInsertRows(parent, row, row + count - 1);
    // FIXME: Implement me!
    endInsertRows();
}

bool GroupModel::removeRows(int row, int count, const QModelIndex &parent)
{
    beginRemoveRows(parent, row, row + count - 1);
    // FIXME: Implement me!
    endRemoveRows();
}
*/
