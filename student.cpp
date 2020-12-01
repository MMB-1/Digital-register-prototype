#include "student.h"

Student::Student()
{
    id = getCurrentID();
}

Student::Student(const Student& other)
{
    id = other.id;
    firstName = other.firstName;
    lastName = other.lastName;
    phoneNumber = other.phoneNumber;
}

bool Student::compareTo(const Student& other) const
{
    if(id != other.id || firstName != other.firstName || firstName != other.firstName ||
       lastName != other.lastName || phoneNumber != other.phoneNumber)
    {
        return false;
    }

    return true;
}

int Student::getCurrentID()
{
    static int i = 0;
    ++i;
    return i;
}
