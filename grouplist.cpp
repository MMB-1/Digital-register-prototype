#include "grouplist.h"
#include "group.h"

GroupList::GroupList(QObject *parent) : QObject(parent)
{
    Group g1, g2;
    g1.groupName = "Klasa 1A";
    g2.groupName = "Klasa 1B";
    mItems.append(g1);
    mItems.append(g2);
}

QVector<Group> GroupList::items() const
{
    return mItems;
}

bool GroupList::setItemAt(int index, const Group& item)
{
    if(index < 0 || index >= mItems.size())
        return false;

    const Group& oldItem = mItems.at(index);
    if (item.ID() == oldItem.ID() || item.groupName == oldItem.groupName)
        return false;

    mItems[index] = item;
    return true;
}

void GroupList::appendItem()
{
    emit preItemAppended();

    Group item;
    mItems.append(item);

    emit postItemAppended();
}

void GroupList::appendItem(QString name, QVector<int> students)
{
    emit preItemAppended();

    Group item;
    item.setStudentIDs(students);
    item.groupName = name;
    mItems.append(item);

    emit postItemAppended();
}

void GroupList::removeItem(int index)
{
    if(index < 0 || index >= mItems.size())
        return;

    emit preItemRemoved(index);

    mItems.removeAt(index);

    emit postItemRemoved();
}
