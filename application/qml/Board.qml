import QtQuick 2.5
import "."

Rectangle {

    property alias cells: cells

    x: parent.horizontalCenter - width/2

    //function to return letter coresponing to the index
    function returnPositionSignColumn(index) {

        switch(index) {
            case 1: return "A";
            case 2: return "B";
            case 3: return "C";
            case 4: return "D";
            case 5: return "E";
            case 6: return "F";
            case 7: return "G";
            case 8: return "H";
            case 9: return "I";
            case 10: return "J";

            default: return "";
        }
    }

    //return index if you want to draw it
    function returnPositionSignRow(index){

        if(index >0) {
            return index;
        }
        else
            return "";
        }

    Row {
        id: firstRow
        spacing: 2
        x:0
        y:0

        Repeater {
            model: 11
            delegate: Rectangle {
                        width: Style.cellWidth
                        height: Style.cellHeight
                        color: Style.cellColor
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            text: returnPositionSignRow(index)
                        }
                      }
        }
    }

    Column {
        id: firstColumn
        spacing: 2
        x:0
        y:0

        Repeater {
            model: 11
            delegate: Rectangle {
                        width: Style.cellWidth
                        height: Style.cellHeight
                        color: Style.cellColor
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            text: returnPositionSignColumn(index)
                        }
                      }
        }
    }

    Grid {
        x:Style.cellWidth +2   //after the first column and spacing
        y:Style.cellHeight +2  // after the first row and spacing

        rows: Style.rowCount
        columns: Style.columnCount
        spacing: 2

        Repeater {
            id: cells
            model: Style.rowCount * Style.columnCount
            delegate: Rectangle {
                       width: Style.cellWidth
                       height: Style.cellHeight
                       color: Style.cellColor
            }
        }
    }

}
