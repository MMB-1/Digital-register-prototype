import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

Page {
    id: page
    implicitWidth: 600
    implicitHeight: 400

    title: qsTr("Nazwa wybranego kwadracika z poprzedniej strony tu bedzie")

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
            z: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 200
            anchors.horizontalCenter: parent.horizontalCenter

            text: qsTr("Oceny")
            //onClicked: {
            //   stackView.replace("ZajeciaAdd.qml")
        }
        Button {
            id: button2
            x: 45
            z: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 150
            anchors.horizontalCenter: parent.horizontalCenter

            text: qsTr("Frekwencja")
            //onClicked: {
            //   stackView.replace("ZajeciaAdd.qml")
        }
        Button {
            id: button3
            x: 45
            z: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            anchors.horizontalCenter: parent.horizontalCenter

            text: qsTr("Uczniowie")
            //onClicked: {
            //   stackView.replace("ZajeciaAdd.qml")
        }


        Text {

            id: text1
            text: qsTr("Nazwa zajęć (właciwosc klasy)")
            y: 65
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
            font.bold: true
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 3
                color: "#80000000"
                radius: 2
                samples: 3

            }

        }


        Text {
            id: text2
            text: qsTr("inna właciwosc klasy")
            y: 85
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 2
                color: "#80000000"
                radius: 1
                samples: 3

            }

        }

        Text {
            id: text3
            y: 105
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("jeszcze inna właciwosc klasy")
            font.pixelSize: 12
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 2
                color: "#80000000"
                radius: 1
                samples: 3

            }

        }

        Text {
            id: text4
            y: 125
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("i jeszcze inna właciwosc klasy")
            font.pixelSize: 12
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 2
                color: "#80000000"
                radius: 1
                samples: 3
            }
        }
    }

    TextField {
        id: search
        x: 400
        y: 55
        width: 160
        height: 30
        placeholderText: qsTr("Tego pewnie nie będzie")


        anchors.right: rectangle.right
        anchors.rightMargin: 20
        anchors.top: rectangle.top
        anchors.topMargin: 20


    }

    ListView {
        id: listView
        x: 57
        y: 37
        width: 110
        height: 160

        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                spacing: 10
                Rectangle {
                    width: 250
                    height: 40
                    color: colorCode
                    Text {
                        text: name
                        color: "#ffffff"
                        anchors.horizontalCenter: parent.horizontalCenter

                        anchors.right: parent.right
                        anchors.rightMargin: 5
                        font.bold: true

                    }


                }
            }
        }
        model: ListModel {
            ListElement {
                name: "1) 03.11.2020 - temat: ..."
                colorCode: "grey"
            }

            ListElement {
                name: "2) 10.11.2020 - temat: ..."
                colorCode: "red"
            }

            ListElement {
                name: "3) 17.11.2020 - temat: ..."
                colorCode: "blue"
            }

            ListElement {
                name: "4) 24.11.2020 - temat: ..."
                colorCode: "green"
            }
        }
    }




}



