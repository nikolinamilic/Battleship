import QtQuick 2.5
import "."


//this should be written differently: 5 types of one ship


//create a list of ship descriptions and dots to place on grid
Column{

    id: listShip
    spacing:20

    Row {     //picture, name and dots are placed in a row
        id: cargoDescript
        spacing:10   //spacing between every item in a row

        Image {   //logo of a ship type
            width: Style.shipPictureWidth
            height: Style.shipPictureHeight
            source: "pictures/CargoShip.png"
        }
        Rectangle { //container of a ship name
            color: Style.backgroundColor
            width: Style.shipDescriptionLettersWidth
            height: Style.shipDescriptionLettersHeight
            Text {
                anchors.centerIn: parent
                text: "Carrier"
            }
        }

        Rectangle { //container of dots
            id:rootCargo
            width:( (Style.cellWidth *5) + (2*5) +2)
            height: (Style.cellHeight + 4)
            //color: Style.backgroundColor

            MouseArea { // mouse area for enabling drag
                id: mouseArea
                anchors.fill: parent
                drag.target:  cargoPoints
                onDoubleClicked: {rootCargo.rotation = rootCargo.rotation + 90}    //rotate for 90 degrees on double click
                onReleased: parent = cargoPoints.Drag.target !== null ? cargoPoints.Drag.target : rootCargo   //return to root if not released on target

                Rectangle {

                    id:cargoPoints
                    border.width: 1

                    width: (Style.cellWidth *5) + (2*5) +2
                    height: Style.cellHeight + 4
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        verticalCenter: parent.verticalCenter
                    }

                    Drag.active: mouseArea.drag.active  //activate drag
                    Drag.source: drop

                    states: [
                        State {
                        when: cargoPoints.Drag.active
                            ParentChange {
                                target: cargoPoints
                                parent: rootCargo
                            }
                            AnchorChanges {
                                target: cargoPoints
                                anchors.horizontalCenter: undefined
                                anchors.verticalCenter: undefined
                            }
                        }
                    ]

                    Row {  //create 5 dots for a cargo ship
                        id: dots
                        x:2
                        y:2
                        spacing: 2
                        Repeater {
                            model: 5
                            delegate: Rectangle {
                                        width: Style.cellWidth
                                        height: Style.cellHeight
                                        radius: width /2
                                        color: "black"
                            }

                        }
                    }
                }

            }
        }
    }

    //next ship : battleship , with 4 dots

    Row{ //picture, name and dots are placed in a row
         id: battleShipDescript
        spacing:10   //spacing between every item in a row
        Image { //logo of a ship type
            width: Style.shipPictureWidth
            height: Style.shipPictureHeight
            source: "pictures/BattleShip.png"
        }
        Rectangle {  //container of a ship name
            color: Style.backgroundColor
            width: Style.shipDescriptionLettersWidth
            height: Style.shipDescriptionLettersHeight
            Text {
                anchors.centerIn: parent
                text: "Battleship"
            }
        }

        Rectangle { //container of dots
            id:rootBattleShip
            width:( (Style.cellWidth *4) + (2*4) +2)
            height: (Style.cellHeight + 4)
            //color: Style.backgroundColor

            MouseArea {  // mouse area for enabling drag
                id: mouseAreaBattleShip
                anchors.fill: parent
                drag.target:  battleShipPoints
                onDoubleClicked: {rootBattleShip.rotation = rootBattleShip.rotation + 90}   //rotate for 90 degrees on double click
                onReleased: parent = battleShipPoints.Drag.target !== null ? battleShipPoints.Drag.target : rootBattleShip  //return to root if not released on target

                Rectangle {

                    id:battleShipPoints
                    border.width: 1

                    width: (Style.cellWidth *4) + (2*4) +2
                    height: Style.cellHeight + 4
                    anchors {
                        horizontalCenter: parent.horizontalCenter;
                        verticalCenter: parent.verticalCenter
                    }

                    Drag.active: mouseAreaBattleShip.drag.active
                    Drag.source: drop

                    states: [
                        State {
                            when: battleShipPoints.Drag.active
                            ParentChange {
                                target: battleShipPoints
                                parent: rootBattleShip
                            }

                            AnchorChanges {
                                target: battleShipPoints;
                                anchors.horizontalCenter: undefined;
                                anchors.verticalCenter: undefined
                            }
                        }
                    ]
        Row {
            x:2
            y:2
            spacing: 2
            Repeater {
                model: 4
                delegate: Rectangle {
                            width: Style.cellWidth
                            height: Style.cellHeight
                            radius: width /2
                            color: "black"
                            }
            }
        }

    } }
    }
    }

    Row{
         id: cruiserDescript
        spacing:10
        Image {
            width: Style.shipPictureWidth
            height: Style.shipPictureHeight
            source: "pictures/CruiseShip.png"
        }
        Rectangle {
            color: Style.backgroundColor
            width: Style.shipDescriptionLettersWidth
            height: Style.shipDescriptionLettersHeight
            Text {
                anchors.centerIn: parent
                text: "Cruiser"
            }
        }

        Rectangle
        {
            id:rootCruiser
            width:( (Style.cellWidth *3) + (2*3) +2)
            height: (Style.cellHeight + 4)
            //color: Style.backgroundColor

            MouseArea {
                id: mouseAreaCruiser
                anchors.fill: parent
                drag.target:  cruiserPoints
                onDoubleClicked: {rootCruiser.rotation = rootCruiser.rotation + 90}
                onReleased: parent = cruiserPoints.Drag.target !== null ? cruiserPoints.Drag.target : rootCruiser

                Rectangle {

                    id:cruiserPoints
                    border.width: 1

                    width: (Style.cellWidth *3) + (2*3) +2
                    height: Style.cellHeight + 4
                    anchors {
                        horizontalCenter: parent.horizontalCenter;
                        verticalCenter: parent.verticalCenter
                    }

                    Drag.active: mouseAreaCruiser.drag.active
                    Drag.source: drop

                    states: [
                        State {
                            when: cruiserPoints.Drag.active
                            ParentChange {
                                target: cruiserPoints
                                parent: rootCruiser
                            }

                            AnchorChanges {
                                target: cruiserPoints;
                                anchors.horizontalCenter: undefined;
                                anchors.verticalCenter: undefined
                            }
                        }
                    ]
        Row {
            x:2
            y:2
            spacing: 2
            Repeater {
                model: 3
                delegate: Rectangle {
                            width: Style.cellWidth
                            height: Style.cellHeight
                            radius: width /2
                            color: "black"
                            }
            }
        }

    } }
    }
    }
    Row{
        id: sailerDescript
        spacing:10
        Image {
            width: Style.shipPictureWidth
            height: Style.shipPictureHeight
            source: "pictures/Sailer.png"
        }
        Rectangle {
            color: Style.backgroundColor
            width: Style.shipDescriptionLettersWidth
            height: Style.shipDescriptionLettersHeight
            Text {
                anchors.centerIn: parent
                text: "Sailer"
            }
        }


        Rectangle
        {
            id:rootSailer
            width:( (Style.cellWidth *3) + (2*3) +2)
            height: (Style.cellHeight + 4)
            //color: Style.backgroundColor

            MouseArea {
                id: mouseAreaSailer
                anchors.fill: parent
                drag.target:  sailerPoints
                onDoubleClicked: {rootSailer.rotation = rootSailer.rotation + 90}
                onReleased: parent = sailerPoints.Drag.target !== null ? sailerPoints.Drag.target : rootSailer

                Rectangle {

                    id:sailerPoints
                    border.width: 1

                    width: (Style.cellWidth *3) + (2*3) +2
                    height: Style.cellHeight + 4
                    anchors {
                        horizontalCenter: parent.horizontalCenter;
                        verticalCenter: parent.verticalCenter
                    }

                    Drag.active: mouseAreaSailer.drag.active
                    Drag.source: drop

                    states: [
                        State {
                            when: sailerPoints.Drag.active
                            ParentChange {
                                target: sailerPoints
                                parent: rootSailer
                            }

                            AnchorChanges {
                                target: sailerPoints;
                                anchors.horizontalCenter: undefined;
                                anchors.verticalCenter: undefined
                            }
                        }
                    ]
        Row {
            x:2
            y:2
            spacing: 2
            Repeater {
                model: 3
                delegate: Rectangle {
                            width: Style.cellWidth
                            height: Style.cellHeight
                            radius: width /2
                            color: "black"
                            }
            }
        }

    } }
    }
    }
    Row {
        id: submarineDescript
        spacing:10
        Image {
            width: Style.shipPictureWidth
            height: Style.shipPictureHeight
            source: "pictures/Submarine.png"
        }
        Rectangle {
            color: Style.backgroundColor
            width: Style.shipDescriptionLettersWidth
            height: Style.shipDescriptionLettersHeight
            Text {
                anchors.centerIn: parent
                text: "Submarine"
            }
        }

        Rectangle
        {
            id:rootSubmarine
            width:( (Style.cellWidth *2) + (2*2) +2)
            height: (Style.cellHeight + 4)
            //color: Style.backgroundColor

            MouseArea {
                id: mouseAreaSubmarine
                anchors.fill: parent
                drag.target:  submarinePoints
                onDoubleClicked: {rootSubmarine.rotation = rootSubmarine.rotation + 90}
                onReleased: parent = submarinePoints.Drag.target !== null ? submarinePoints.Drag.target : rootSubmarine

                Rectangle {

                    id:submarinePoints
                    border.width: 1

                    width: (Style.cellWidth *2) + (2*2) +2
                    height: Style.cellHeight + 4
                    anchors {
                        horizontalCenter: parent.horizontalCenter;
                        verticalCenter: parent.verticalCenter
                    }

                    Drag.active: mouseAreaSubmarine.drag.active
                    Drag.source: drop

                    states: [
                        State {
                            when: submarinePoints.Drag.active
                            ParentChange {
                                target: submarinePoints
                                parent: rootSubmarine
                            }

                            AnchorChanges {
                                target: submarinePoints;
                                anchors.horizontalCenter: undefined;
                                anchors.verticalCenter: undefined
                            }
                        }
                    ]
        Row {
            x:2
            y:2
            spacing: 2
            Repeater {
                model: 2
                delegate: Rectangle {
                            width: Style.cellWidth
                            height: Style.cellHeight
                            radius: width /2
                            color: "black"
                            }
            }
        }

    } }
    }
    }





}

