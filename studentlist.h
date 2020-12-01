#pragma once

#include <QObject>
#include <QVector>

#include "student.h"

class StudentList : public QObject
{
    Q_OBJECT
public:
    explicit StudentList(QObject* parent = nullptr);

    QVector<Student> items() const;

    bool setItemAt(int index, const Student& item);

signals:
    void preItemAppended();
    void postItemAppended();

    void preItemRemoved(int index);
    void postItemRemoved();

public slots:
    void appendItem();
    void removeItem(int index);

private:
    QVector<Student> mItems;
};

