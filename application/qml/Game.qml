import QtQuick 2.5
import "."

Item {

    UpperWindow {
        x:0
        y:0
        anchors.top: parent.top
        anchors.bottom: parent.verticalCenter
        anchors.margins: 10
        width: parent.width
        height: parent.height/2
    }

    LowerWindow {
        x:0
        y:parent.height/2
        anchors.top: parent.verticalCenter
        anchors.bottom: parent.bottom
        anchors.margins: 10
        width: parent.width
        height: parent.height/2
    }
}
