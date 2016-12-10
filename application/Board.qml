import QtQuick 2.5
import "Variable.js" as Variable
import "."


Rectangle {

    id: board
    anchors.centerIn: parent

    function returnPositionSign(index){

        switch(index){
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                return index;

            case 11: return "A";
            case 22: return "B";
            case 33: return "C";
            case 44: return "D";
            case 55: return "E";
            case 66: return "F";
            case 77: return "G";
            case 88: return "H";
            case 99: return "I";
            case 110: return "J";

            default: return "";
        }

    }


    Grid {

        rows: Variable.ROW_COUNT
        columns: Variable.COLUMN_COUNT
        spacing: 2
        anchors.centerIn: parent

        Repeater {
            model: Variable.ROW_COUNT * Variable.COLUMN_COUNT
            delegate: Rectangle {
                        width: Variable.CELL_WIDTH
                        height: Variable.CELL_HEIGHT
                        color: Style.cellColor
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            text: returnPositionSign(index)
                        }





                        }

         }
    }
}
