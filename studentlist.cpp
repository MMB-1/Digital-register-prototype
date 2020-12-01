#include "studentlist.h"
#include "student.h"

StudentList::StudentList(QObject* parent)
    :QObject(parent)
{
    Student s;
    s.firstName = "Marcin";
    s.lastName = "Tomaszewski";
    s.phoneNumber = "123456";
    mItems.append(s);

    Student s2;
    s2.firstName = "Herman";
    s2.lastName = "Wojtkowiak";
    s2.phoneNumber = "123456789";
    mItems.append(s2);

    Student s3;
    s3.firstName = "Bogusław";
    s3.lastName = "Łęcina";
    s3.phoneNumber = "112260911";
    mItems.append(s3);
}

QVector<Student> StudentList::items() const
{
    return mItems;
}

bool StudentList::setItemAt(int index, const Student& item)
{
    if(index < 0 || index >= mItems.size())
        return false;

    const Student& oldItem = mItems.at(index);
    if (item.compareTo(oldItem))
        return false;

    mItems[index] = item;
    return true;
}

void StudentList::appendItem()
{
    emit preItemAppended();

    Student item;
    mItems.append(item);

    emit postItemAppended();
}

void StudentList::removeItem(int index)
{
    if(index < 0 || index >= mItems.size())
        return;

    emit preItemRemoved(index);

    mItems.removeAt(index);

    emit postItemRemoved();
}

