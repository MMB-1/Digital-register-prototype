import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

Page {

    background: Rectangle{
        width: parent.width
        height: parent.height
        color: setBackgroundColor()
    }
    property int currentIndex: 0
    onCurrentIndexChanged: {
        jasny.checked = currentIndex == 0
        ciemny.checked = currentIndex == 1
    }

    function setBackgroundColor(){
         var color;
        if(currentIndex==0)
            color="white";
        else
            color="#575656";

        return color;
    }
    function setFontColor(){
        var fontColor;
        if(currentIndex==0)
            fontColor="black";
        else
            fontColor="white";

        return fontColor;
    }

    RadioButton {
        id: jasny
        x: 100
        y: 123
        width: 40
        height: 40
        onClicked: {
            currentIndex=0
        }
        checked: true
    }

    RadioButton {
        id: ciemny
        x: 100
        y: 169
        width: 40
        height: 40
        onClicked:{
            currentIndex=1
        }
    }

    Text {
        id: text1
        x: 146
        y: 132
        text: qsTr("Jasny motyw")
        font.pixelSize: 18
        color: setFontColor()
    }

    Text {
        id: text2
        x: 146
        y: 178
        text: qsTr("Ciemny motyw")
        font.pixelSize: 18
         color: setFontColor()
    }

    Column {
        id: column
        x: 44
        y: 48
        width: 31
        height: 400

    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
