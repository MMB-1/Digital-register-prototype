import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import account 1.0

Page {
    id: strona
    implicitWidth: 600
    implicitHeight: 400
    title: qsTr("Wirtualny dziennik")

    Image {
        id: tlo
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: "stock-images/art-2578353.jpg"

        Text {
            id: copyright_text
            x: 60
            y: 60
            color: "#ffffff"
            font.pixelSize: 12
            text: qsTr("©KMMM Team")
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 3
                color: "#80000000"
                radius: 2
                samples: 3
            }
        }

        Rectangle {
            id: rectangle_logowania_bialy
            visible: !account.statusLogged()
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width / 2
            height: parent.width / 3
            color: "#ffffff"
            radius: 9
            opacity: 0.9

            Item{
                id:stuff_do_logowania
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width * 0.9
                height: parent.height * 0.9
                TextField{
                    id: loginfield
                    placeholderText: qsTr("Nazwa użytkownika")
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: parent.y
                    anchors.topMargin: parent.implicitHeight + 25
                    width: parent.width - 75

                    Text{
                        id: logowanie_info_czy_bledne_itp
                        anchors.bottom: parent.top
                        anchors.bottomMargin: 5
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        text: ""
                        color: "red"

                    }

                    TextField{
                        id: passwordfield
                        placeholderText: qsTr("Hasło")
                        anchors.top: parent.bottom
                        anchors.topMargin: 1
                        width: parent.width
                        echoMode: TextInput.Password
                    }

                    Item {
                        id: linijka_dla_dwoch_buttonow
                        anchors.top: passwordfield.bottom
                        anchors.topMargin: 10
                        anchors.horizontalCenter: passwordfield.horizontalCenter
                        width: passwordfield.width


                    Button {
                        id: zaloguj_button

                            x: parent.width /2 + 2
                            width: parent.width /2 - 4
                        text: qsTr("Zaloguj")
                        onClicked: {
                            if(account.checkData(loginfield.text, passwordfield.text)){
                                account.login(account.getId(loginfield.text))
                                rectangle_logowania_bialy.visible = !account.statusLogged()
                                myModel.updateModel(account.loggedId)
                            }
                            else{
                                logowanie_info_czy_bledne_itp.color = "red"
                                logowanie_info_czy_bledne_itp.text = "Wprowadzono błędne dane"
                                loginfield.text = ""
                                passwordfield.text = ""
                            }
                        }

                    }
                    Button {
                        id: rejestracja
                        text: qsTr("Zarejestruj")
                        x: parent.x + 2
                        width: zaloguj_button.width

                        onClicked: {
                            if(!account.checkData(loginfield.text)){
                                database.inserIntoTable(loginfield.text, passwordfield.text)
                                logowanie_info_czy_bledne_itp.text = "Pomyślnie utworzono użytkownika"
                                logowanie_info_czy_bledne_itp.color = "green"
                                loginfield.text = ""
                                passwordfield.text = ""
                            }
                            else{
                                logowanie_info_czy_bledne_itp.color = "red"
                                logowanie_info_czy_bledne_itp.text = "Już utworzono takiego użytkownika"
                                loginfield.text = ""
                                passwordfield.text = ""
                            }
                        }
                    }

                    }
                }


            }

            Label {
                x: 38
                y: 107
                id: naglowek_digitalregister
                color: "#FFF"
                text: qsTr("'QT' WIRTUALNY DZIENNIK")
                font.pixelSize: 45
                font.weight: Font.Bold

                font.family: "Courier New"
                styleColor: "#000000"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: -50

                layer.enabled: true
                layer.effect: DropShadow {
                    verticalOffset: 3
                    color: "#80000000"
                    radius: 4
                    samples: 2

                }
            }

        }

    }



   /* In the future probably

        states: [State {
        name: "niezalogowany"



        },
        State {
                name: "zalogowany"



                }

    ] */





    /*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
}
