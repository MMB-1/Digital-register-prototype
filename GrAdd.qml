import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

//import student 1.0
import groups 1.0

Page {
    id: page
    implicitWidth: 600
    implicitHeight: 400

    title: qsTr("Dodawanie nowej grupy")
    RowLayout{
        spacing: 15
        y: 3
        TextField {
            id: groupNameTextField
            placeholderText: "nazwa grupy"
        }
        RowLayout{
            Button{
                text: qsTr("Wyczyść zaznaczenia")
                onClicked: {
                    myModel.uncheckAll()
                }
            }
            Button{
                text: qsTr("Zaznacz wszyskich")
                onClicked: {
                    myModel.checkAll()
                }
            }
        }
    }
    TableView {
        y: groupNameTextField.height + 6
        id: tableViewSudents
        width: window.width - 210
        height: window.height - 10

        TableViewColumn {
            width: 20
            delegate: CheckBox{
                id: checkbox
                checked: model.checkedRole
                onClicked: model.checkedRole = checked
            }
        }
        TableViewColumn {
            role: "id"
            title: "id"
            width: 30

        }
        TableViewColumn {
            role: "fname"
            title: "Imię"
            width: 100
        }
        TableViewColumn {
            role: "lname"
            title: "Nazwisko"
            width: 100
        }
        TableViewColumn {
            role: "phone"
            title: "Numer telefonu"
            width: 150
        }

        model: myModel
    }


    Rectangle {
        id: rectangle

        // y: 0
        width: 200
        height: window.height
        anchors.right: parent.right
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#dcd7d1"
            }

            GradientStop {
                position: 0.76699
                color: "#999999"
            }
        }
        anchors.rightMargin: 0
        // anchors.leftMargin: 400


        Button {
            id: buttonm
            x: 45
            y: window.height - 130
            z: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            anchors.horizontalCenter: parent.horizontalCenter

            text: qsTr("Dodaj grupę")
            onClicked: {
                groupList.appendItem(groupNameTextField.text, myModel.checked);
                stackView.pop();
            }
        }

        TextField {
            id: search
            x: 400
            y: 55
            width: 160
            height: 30
            placeholderText: qsTr("Szukaj...")


            anchors.right: rectangle.right
            anchors.rightMargin: 20
            anchors.top: rectangle.top
            anchors.topMargin: 20
        }
    }
}




