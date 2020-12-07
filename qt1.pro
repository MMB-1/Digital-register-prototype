QT += qml quick widgets sql
CONFIG += c++11
QT += gui


# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        account.cpp \
        classes.cpp \
        database.cpp \
        group.cpp \
        grouplist.cpp \
        groupmodel.cpp \
        student.cpp \
        studentlist.cpp \
        backend.cpp \
        main.cpp \
        studentmodel.cpp

RESOURCES += qml.qrc \
    qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

FORMS += \
    Twoje_zajecia.ui

DISTFILES += \
    GrAdd.qml \
    Grupy.qml \
    Page1Form.ui.qml \
    Page2Form.ui.qml \
    Twoje_zajecia.qml \
    Uczniowie.qml \
    UczniowieForm.ui.qml \
    ZajeciaAdd.qml \
    home-screen-512.png \
    main.qml \
    qt1.pro.user \
    qtquickcontrols2.conf \
    stock-images/art-2578353.jpg \
    icon.png

HEADERS += \
    account.h \
    classes.h \
    database.h \
    group.h \
    grouplist.h \
    groupmodel.h \
    student.h \
    studentlist.h \
    backend.h \
    studentmodel.h


