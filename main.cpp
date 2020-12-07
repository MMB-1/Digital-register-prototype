#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlComponent>
#include <studentmodel.h>
#include <studentlist.h>
#include <groupmodel.h>
#include <grouplist.h>
#include <account.h>
#include <QQuickView>

#include "database.h"
#include "backend.h"
#include <QIcon>
#include <QThread>


int main(int argc, char *argv[])
{


    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qmlRegisterType<BackEnd>("io.qt.backend",1,0,"BackEnd");
    QGuiApplication app(argc, argv);

    qmlRegisterType<Account>("account", 1, 0, "Account");

    qmlRegisterType<StudentModel>("student", 1, 0, "StudentModel");
    qmlRegisterUncreatableType<StudentList>("student", 1, 0, "StudentList", QStringLiteral("StudentList should not be created in QML"));
    qmlRegisterType<StudentModel>("student", 1, 0, "Student");
    qmlRegisterType<GroupModel>("groups", 1, 0, "GroupModel");
    qmlRegisterUncreatableType<GroupList>("group", 1, 0, "GroupList", QStringLiteral("GroupList should not be created in QML"));
    qmlRegisterType<GroupModel>("groups", 1, 0, "Group");
    app.setWindowIcon(QIcon("://icon.png"));


    StudentList studentList;
    GroupList groupList;
    DataBase database;
    database.connectToDataBase();
    StudentModel model;
    Account account;




    QQmlApplicationEngine engine;


    engine.rootContext()->setContextProperty(QStringLiteral("studentList"), &studentList);
    engine.rootContext()->setContextProperty(QStringLiteral("groupList"), &groupList);
    engine.rootContext()->setContextProperty("database", &database);
    engine.rootContext()->setContextProperty("myModel", &model);
    engine.rootContext()->setContextProperty("account", &account);
    engine.rootContext()->setContextProperty(QStringLiteral("groupList"), &groupList);

   // model.updateModel(account.loggedId());
  // QObject::connect(&account, SIGNAL(loginChanged(int)), &model, SLOT(updateModel));
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
