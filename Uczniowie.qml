import QtQuick 2.12
import QtQuick 2.5
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2
import student 1.0

Page
{
    id: page
    implicitWidth: 600
    implicitHeight: 400
    title: qsTr("Uczniowie")
    property bool startButton: database.dbIsEmpty()


    TableView
    {
        id: tableView
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 5
        TableViewColumn{
            role:"id";
            title: "Id";
        }

        TableViewColumn {
            role: "fname"
            title: "Imię"
        }
        TableViewColumn {
            role: "lname"
            title: "Nazwisko"
        }
        TableViewColumn {
            role: "phone"
            title: "Telefon"
        }

        model: myModel


        rowDelegate: Rectangle
        {
            anchors.fill: parent
            color: styleData.selected ? 'skyblue' : (styleData.alternate ? 'whitesmoke' : 'white');
            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton | Qt.LeftButton
                onClicked: {
                    tableView.selection.clear()
                    tableView.selection.select(styleData.row)
                    tableView.currentRow = styleData.row
                    tableView.focus = true

                    switch(mouse.button) {
                    case Qt.RightButton:
                        contextMenu.popup() // Call the context menu
                        break
                    default:
                        break
                    }
                }
            }
        }


        // The context menu offers deleting a row from the database
        Menu
        {
            id: contextMenu

            MenuItem {
                text: qsTr("Usuń")
                onTriggered: {
                    /* Call the dialog box that will clarify the intention to remove the row from the database
                         * */
                    dialogDelete.open()
                }
            }
            MenuItem{
                text: qsTr("Dodaj ucznia")
                onTriggered:{
                    dodawanie.open()
                }
            }
        }

        // Dialog of confirmation the removal line from the database
        MessageDialog
        {
            id: dialogDelete
            title: qsTr("Usuń ucznia")
            text: qsTr("Potwierdź usunięcie ucznia")
            icon: StandardIcon.Warning
            standardButtons: StandardButton.Ok | StandardButton.Cancel

            // If the answer ...
            onAccepted: {
                /* ... remove the line by id, which is taken from the data model
                     * on the line number in the presentation
                     * */
                database.removeRecord(myModel.getId(tableView.currentRow))
                myModel.updateModel();
                startButton = database.dbIsEmpty()
            }
        }
        Popup
        {
            id:dodawanie

            anchors.centerIn: parent
            width:parent.width/2
            height:parent.height/2
            Column
            {
                Text {text: qsTr("Imię")}
                TextField {id: fnameField}

                Text {text: qsTr("Nazwisko")}
                TextField { id: lnameField}

                Text {text: qsTr("Numer Telefonu")}
                TextField {id: phoneField}

                Button {
                    text: qsTr("Dodaj Ucznia")
                    anchors.right:dodawanie
                    // Make a new entry in the database
                    onClicked: {
                        database.inserIntoTable(fnameField.text , lnameField.text, phoneField.text)
                        myModel.updateModel() // And updates the data model with a new record
                        startButton = database.dbIsEmpty()
                        dodawanie.close()
                        fnameField.text = ""
                        lnameField.text = ""
                        phoneField.text = ""
                    }
                }
            }
        }
    }
    Button{
        id: addstudent
        anchors.centerIn: parent
        width: 300
        height: 100
        text: qsTr("Dodaj ucznia")
       visible: startButton
        onClicked:{
            dodawanie.open()
    }
}
}
