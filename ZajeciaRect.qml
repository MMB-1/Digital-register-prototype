import QtQuick 2.0

Item {
id:root
width:100
height: 100
property color znaj: "red"
property string tekst: "Najlepsze zajęcia"
Rectangle{
    anchors.fill: root
    color: root.znaj
    Text{
        text: root.tekst
        anchors.centerIn: parent
        color: "white"
    }
    MouseArea {
    anchors.fill: parent
    onClicked: { gridView.currentIndex = index
       stackView.push("ZajeciaPage.qml")
    }
    }
}
}
