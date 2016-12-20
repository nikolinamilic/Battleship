import QtQuick 2.5
import "."

Item {

    id: myWindow

    Board {
        id: myBoard
        Component.onCompleted: {
            var mappedCells = myBoard.cells.mapToItem(myWindow, 0, 0)
            large.x = myBoard.cells.itemAt(0).x + mappedCells.x;
            large.y = myBoard.cells.itemAt(0).y + mappedCells.y;
            big.x = myBoard.cells.itemAt(10).x + mappedCells.x;
            big.y = myBoard.cells.itemAt(10).y+ mappedCells.y;
            medium1.x = myBoard.cells.itemAt(20).x + mappedCells.x;
            medium1.y = myBoard.cells.itemAt(20).y+ mappedCells.y;
            medium2.x = myBoard.cells.itemAt(30).x + mappedCells.x;
            medium2.y = myBoard.cells.itemAt(30).y+ mappedCells.y;
            small.x = myBoard.cells.itemAt(40).x + mappedCells.x;
            small.y = myBoard.cells.itemAt(40).y+ mappedCells.y;
        }
    }

    Ship {
        id: large
        numDots: 5
    }

    Ship {
        id: big
        numDots: 4
    }

    Ship {
        id: medium1
        numDots: 3
    }

    Ship {
        id: medium2
        numDots: 3
    }

    Ship {
        id: small
        numDots: 2
    }

}
