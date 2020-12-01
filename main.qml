import QtQuick 2.12
import QtQuick.Controls 2.5
import io.qt.backend 1.0
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: window
    width: 640
    height: 480
    minimumHeight: 380
    minimumWidth: 600
    visible: true
    title: qsTr("Dziennik elektroniczny") //lepsza nazwa
    property bool czylogin: true
    header: ToolBar {
        visible: czylogin
        contentHeight: toolButton.implicitHeight
        background: Rectangle{
        implicitWidth: parent.width
        implicitHeight: parent.height
        gradient: Gradient {


        GradientStop{position: 1; color: "#99CCE3"} //dol
        GradientStop{position: 0.2; color: "#5090AD"}
        GradientStop{position: 0; color: "#BADAE9"} //gora
        }


        }

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }

        ToolButton {
            Image {
            anchors.fill: parent

            fillMode: Image.PreserveAspectFit
            source: "home-screen-512.png"
            }
            id: homeButton
            x: toolButton.x + 40 ;
           // text: "\u2302" //2302 //do skasowania i 1 i 2?
            //font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {

               stackView.replace("StronaGlowna.qml")
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
            color: "white"
            //mozna dac ładną czcionkę or smth
            //wgle imagem to mozna zfillowac jakims gradientowym or smth, logo?
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height
        background: Rectangle{
        implicitWidth: parent.width
        implicitHeight: parent.height
        gradient: Gradient {


        GradientStop{position: 1; color: "#99CCE3"} //dol
        GradientStop{position: 0.2; color: "#5090AD"}
        GradientStop{position: 0; color: "#BADAE9"} //gora
        }


        }
        Column {
            anchors.fill: parent



            ItemDelegate {


                id: pierwszy
                text: qsTr("Twoje zajęcia")
                width: parent.width
                onClicked: {
                    stackView.replace("Twoje_zajecia.qml")
                    drawer.close()
                }
            }

            Item { //brejk między sekcjami
              width: parent.width
              height: pierwszy.height * 0.35

            }


            ItemDelegate {
                text: qsTr("Uczniowie")
                width: parent.width
                onClicked: {
                    stackView.replace("Uczniowie.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Grupy")
                width: parent.width
                onClicked: {
                    stackView.replace("Grupy.qml")
                    drawer.close()
                }
            }


            Item { //brejk między sekcjami
              width: parent.width
              height: pierwszy.height * 0.35

            }


         /*   ItemDelegate {
                text: qsTr("Page 1")
                width: parent.width
               // height: last2.height - 50
                onClicked: {
                    stackView.replace("Page1Form.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    stackView.replace("Page2Form.ui.qml")
                    drawer.close()
                }
            }
            Item { //brejk między sekcjami
              width: parent.width
              height: pierwszy.height * 0.35

            }
            */
            ItemDelegate {
                text: qsTr("Ustawienia")
                width: parent.width
                onClicked: {
                    stackView.replace("Ustawienia.qml")
                    drawer.close()
                }
            }
            Item { //brejk między sekcjami
              width: parent.width
              height: pierwszy.height * 0.35

            }

            ItemDelegate {
                text: qsTr("Pomoc")
                width: parent.width
                onClicked: {
                    stackView.replace("Pomoc.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "StronaGlowna.qml"
        anchors.fill: parent
    }
}
