import QtQuick 2.5
import "."

Rectangle {

    property int numDots: 5

    id:shipRoot
    width: ((Style.cellSpacing/2 + Style.cellWidth + Style.cellSpacing/2) * numDots)
    height: (Style.cellSpacing/2 + Style.cellHeight + Style.cellSpacing/2)
    //color: Style.backgroundColor

    MouseArea { // mouse area for enabling drag
        id: mouseArea
        anchors.fill: parent
        drag.target:  shipPoints
        onDoubleClicked: {shipRoot.rotation = shipRoot.rotation + 90} //rotate for 90 degrees on double click
        onReleased: parent = shipPoints.Drag.target !== null ? shipPoints.Drag.target : shipRoot //return to root if not released on target

        Rectangle {
            id:shipPoints
            border.width: 1
            width: ((Style.cellSpacing/2 + Style.cellWidth + Style.cellSpacing/2) * numDots)
            height: (Style.cellSpacing/2 + Style.cellHeight + Style.cellSpacing/2)
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            Drag.active: mouseArea.drag.active //activate drag
            Drag.source: drop

            states: [
                State {
                when: shipPoints.Drag.active
                    ParentChange {
                        target: shipPoints
                        parent: shipRoot
                    }
                    AnchorChanges {
                        target: shipPoints
                        anchors.horizontalCenter: undefined
                        anchors.verticalCenter: undefined
                    }
                }
            ]

            Row { //create dots for the ship
                id: dots
                x: 2
                y: 2
                spacing: 2 + 2
                Repeater {
                    model: numDots
                    delegate: Rectangle {
                                width: Style.cellWidth - 2
                                height: Style.cellHeight - 2
                                radius: width/2
                                color: "black"
                    }
                }
            }
        }

    }
}
