import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    implicitWidth: 600
    implicitHeight: 400

    title: qsTr("Twoje zajęcia")


        GridView {
        id: gridView
        x: 36
        y: 21
        width: window.width - 250
        height: window.height - 50
        highlightRangeMode: GridView.NoHighlightRange
        boundsBehavior: Flickable.DragAndOvershootBounds
        onCurrentItemChanged: console.log(model.get(gridView.currentIndex).name + ' selected') //tymczasowo. widzi co jest wybrane
        delegate: Item {
            x: 5
            height: 50
            Column {
                ZajeciaRect {
                    tekst: name

                    id: rect
                    width: { if (window.width > 800 ) {
                        width: 150
                        } else { width: window.width / 7 }


                    }
                    height: { if (window.width > 800 ) {
                            height: 150
                            } else { height: window.width / 7 }


                        }
                    znaj: colorCode
                    anchors.horizontalCenter: parent.horizontalCenter

                }
                spacing: 5
            }


        }
        cellHeight: { if (window.width > 800 ) {
                cellHeigth: 170
                } else { cellHeight: (window.width / 7)+20 }

            }



        cellWidth: { if (window.width > 800 ) {
                cellWidth: 170
                } else { cellWidth: (window.width / 7)+20 }

            }
        model: ListModel {


            ListElement {
                name: "Grey"
                colorCode: "grey"

            }

            ListElement {
                name: "Red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }
            ListElement {
                name: "Green"
                colorCode: "green"
            }

        }
    }


    Rectangle {
        id: rectangle

       // y: 0
        width: 200
        height: window.height
        anchors.right: parent.right
        anchors.rightMargin: 0
       // anchors.leftMargin: 400

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
        Button {
            id: button
            x: 45
            y: window.height - 130
            z: 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            anchors.horizontalCenter: parent.horizontalCenter

            text: qsTr("Dodaj nowe zajęcia")
            onClicked: {
                stackView.push("ZajeciaAdd.qml")

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

/*##^##
Designer {
    D{i:0;formeditorZoom:0.6600000262260437}
}
##^##*/
