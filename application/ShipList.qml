import QtQuick 2.0
import "."

Item {

Column{


    spacing:10


    Row {
        spacing:10
        Image {
            width: 30
            height: 30
            source: "pictures/CargoShip.png"
        }
        Rectangle {
            color: Style.backgroundColor
            width: 60
            height: 30
            Text {
                anchors.centerIn: parent
                text: "Carrier"
            }
        }
    }

    Row
    {
        spacing: 2
        Repeater {
            model: 5
            delegate: Rectangle {
                width: 10
                height: 10
                radius: width /2
                color: "black"
            }

        }

    }


        Row{
        spacing:10
        Image {
            width: 30
            height: 30
            source: "pictures/BattleShip.png"
        }
        Rectangle {
            color: Style.backgroundColor
            width: 60
            height: 30
            Text {
                anchors.centerIn: parent
                text: "Battleship"
            }
        }
    }
    Row
    {
        spacing: 2
        Repeater {
            model: 4
            delegate: Rectangle {
                width: 10
                height: 10
                radius: width /2
                color: "black"
            }

        }

    }

    Row
    {
        spacing:10
        Image {

            width: 30
            height: 30
            source: "pictures/CruiseShip.png"
        }
        Rectangle {
            color: Style.backgroundColor
            width: 60
            height: 30
            Text {
                anchors.centerIn: parent
                text: "Cruiser"
            }
        }
    }
    Row
    {
        spacing: 2
        Repeater {
            model: 3
            delegate: Rectangle {
                width: 10
                height: 10
                radius: width /2
                color: "black"
            }

        }

    }
    Row
    {
        spacing:10
        Image {

            width: 30
            height: 30
            source: "pictures/Sailer.png"
        }
        Rectangle {
            color: Style.backgroundColor
            width: 60
            height: 30
            Text {
                anchors.centerIn: parent
                text: "Sailer"
            }
        }
    }
    Row
    {
        spacing: 2
        Repeater {
            model: 3
            delegate: Rectangle {
                width: 10
                height: 10
                radius: width /2
                color: "black"
            }

        }

    }

    Row
    {
        spacing:10

        Image {
            width: 30
            height: 30
            source: "pictures/Submarine.png"
        }

        Rectangle {
            color: Style.backgroundColor
            width: 60
            height: 30
            Text {
                anchors.centerIn: parent
                text: "Submarine"
            }
        }
    }
    Row
    {
        spacing: 2
        Repeater {
            model: 2
            delegate: Rectangle {
                width: 10
                height: 10
                radius: width /2
                color: "black"
            }

        }

    }


}
}
