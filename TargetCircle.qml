import QtQuick 2.0
import "."
import "Variables.js" as Variable

Rectangle {

    width: Variable.CELL_WIDTH/2
    height: Variable.CELL_HEIGHT/2
    radius: width /2
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    color: "red"
}
