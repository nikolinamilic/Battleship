import QtQuick 2.5
import QtQuick.Window 2.2
import "."

Window {

    visible: true
    width: 1000
    height: 1200
    color: Style.backgroundColor
    title: qsTr("Battleship")




    UpperWindow {
        x:0
        y:5
        width: parent.width
        height: parent.height/2

    }

    LowerWindow {
        x:0
        y:parent.height/2
        width: parent.width
        height: parent.height/2


    }

    ShipList{

        x:20

        y:70
    }





}
