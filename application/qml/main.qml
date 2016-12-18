import QtQuick 2.5
import QtQuick.Window 2.2
import "."

Window {

    id: mainWindow
    visible: true
    width: 1000
    height: 1000
    color: Style.backgroundColor
    title: qsTr("Battleship")

    Loader {
        id: screenLoader
        anchors.fill: parent
        source: "Welcome.qml"
    }
}
