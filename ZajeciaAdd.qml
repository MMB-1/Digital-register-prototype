import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    implicitWidth: 600
    implicitHeight: 400

    title: qsTr("Utwórz nowe zajęcia")

    Label {
        text: qsTr("You are on Page 1.")
        anchors.centerIn: parent



    }

    Button {
        id: button
        x: 401
        y: 296
        text: "Anuluj"
        onClicked: {
            stackView.replace("Page2Form.ui.qml") //idk gdzie

        }
    }
}
