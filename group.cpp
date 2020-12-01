#include "group.h"

Group::Group()
{
    id = getCurrentID();
}

void Group::setStudentIDs(QVector<int> students)
{
    studentIDs = students;
}

int Group::getCurrentID()
{
    static int i = 0;
    ++i;
    return i;
}
