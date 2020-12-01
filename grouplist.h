#ifndef GROUPLIST_H
#define GROUPLIST_H

#include <QObject>

#include "group.h"

class GroupList : public QObject
{
    Q_OBJECT
public:
    explicit GroupList(QObject *parent = nullptr);

    QVector<Group> items() const;

    bool setItemAt(int index, const Group& item);

signals:
    void preItemAppended();
    void postItemAppended();

    void preItemRemoved(int index);
    void postItemRemoved();

public slots:
    void appendItem();
    void appendItem(QString name, QVector<int> students);
    void removeItem(int index);

private:
    QVector<Group> mItems;

};

#endif // GROUPLIST_H
