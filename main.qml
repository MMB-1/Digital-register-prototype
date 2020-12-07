import QtQuick 2.12
import QtQuick.Controls 2.5
import io.qt.backend 1.0
import QtGraphicalEffects 1.0
import QtQml 2.15

ApplicationWindow {
    id: window
    width: 640
    height: 480
    minimumHeight: 380
    minimumWidth: 600
    visible: true
    title: qsTr("Dziennik elektroniczny") //lepsza nazwa
    property bool ifLogged: account.statusLogged()

    header: ToolBar {
        objectName: "pasek"
     Connections{
         target: account
         function onLoginChanged() {
           window.ifLogged = account.statusLogged()
         }
       }

        visible: ifLogged
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
                        stackView.clear()
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
                        stackView.clear()
                        stackView.replace("Uczniowie.qml")
                        drawer.close()

                    }
                }
                ItemDelegate {
                    text: qsTr("Grupy")
                    width: parent.width
                    onClicked: {
                        stackView.clear()
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
                        stackView.clear()
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
                        stackView.clear()
                        stackView.replace("Pomoc.qml")
                        drawer.close()

                    }
                }
            }
        }


        ToolButton {
            id: toolButton
            text: "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                    drawer.open()
            }
}
        ToolButton {
            Image {
            anchors.fill: parent
            id: toolButton2
            fillMode: Image.PreserveAspectFit
            source: "home-screen-512.png"
            }
            id: homeButton
            x: toolButton.x + 40 ;
           // text: "\u2302" //2302 //do skasowania i 1 i 2?
            //font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {

                stackView.clear()
               stackView.replace("StronaGlowna.qml")

                }
            }
       ToolButton {
            id: toolButton3
            x: toolButton2.x + 80 ;
            text: "\u25C0"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                }
}
            visible: { stackView.depth > 1 ? true : false


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




    StackView {
        id: stackView
        initialItem: "StronaGlowna.qml"
        anchors.fill: parent
    }


}

