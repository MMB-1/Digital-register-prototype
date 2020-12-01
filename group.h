#ifndef GROUP_H
#define GROUP_H

#include <QObject>
#include <QVector>

class Group
{
public:
    Group();
    //Group(const Group& other);

    QString groupName;
    int ID() const {return id;}

    void setStudentIDs(QVector<int> students);

private:
    QVector<int> studentIDs;
    static int getCurrentID();

    int id;
};

#endif // GROUP_H
