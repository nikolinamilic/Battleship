import QtQuick 2.5

Item {

    UpperWindow {
        x: 0
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

    ShipList {
        x:20
        y:70
    }
}
