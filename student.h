#pragma once

#include <QObject>

class Student
{
public:
    Student();
    Student(const Student& other); // copying constructor

    qint32 ID() const {return id;}
    QString firstName;
    QString lastName;
    //QDate &birthday; // Left for later (idk how references work on qt)
    QString phoneNumber;

    bool compareTo(const Student& other) const;
private:
    qint32 id;  // id is read only
    static int getCurrentID();
};
