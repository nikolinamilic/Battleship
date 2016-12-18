import QtQuick 2.5
import QtQuick.Window 2.2
import "."

Window {

    id: mainWindow
    visible: true
    width: 1000
    height: 1200
    color: Style.backgroundColor
    title: qsTr("Battleship")

    Welcome {
        id: welcomeScreen
        width: parent.width
        height: parent.height
        visible: true
    }

    Game {
        id: gameScreen
        width: parent.width
        height: parent.height
        visible: false
    }
}
