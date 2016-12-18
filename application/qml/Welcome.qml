import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "."

ColumnLayout {

    spacing: 10

    Text {
        id: welcomeText
        Layout.alignment: Qt.AlignCenter
        text: "Welcome to Battleship!\n\nChoose how to connect with another player:"
        horizontalAlignment: Text.AlignHCenter
        height: 40
    }

    RowLayout {

        Layout.alignment: Qt.AlignCenter
        spacing: 100

        ColumnLayout {

            spacing: 10
            Layout.alignment: Qt.AlignCenter

            TextField {
                id: peerAddressField
                Layout.alignment: Qt.AlignCenter
                text: "localhost"
            }

            TextField {
                id: peerPortField
                Layout.alignment: Qt.AlignCenter
                text: "4001"
            }

            Button {
                id: peerConnectionButton
                Layout.alignment: Qt.AlignCenter
                text: "Connect to peer"
                onClicked: {
                    eventHandler.connectionInitiated(peerAddressField.text, peerPortField.text)
                }
            }
        }

        ColumnLayout {

            spacing: 10
            Layout.alignment: Qt.AlignCenter

            Button {
                id: hostConnectionButton
                Layout.alignment: Qt.AlignCenter
                text: "Wait for peer connection"
                onClicked: {
                    eventHandler.waitForConnections();
                }
            }
        }
    }

    Text {
        id: connectionText
        Layout.alignment: Qt.AlignCenter
        text: "Not connected..."
    }

    Connections {
        target: eventHandler
        ignoreUnknownSignals: true
        // creating slot: on<SignalName>
        // reference signal parameter by name in C++ backend (e.g. message)
        onConnectionMessage: {
            connectionText.text = message;
        }
        onStartGame: {
            screenLoader.source = "Game.qml"
        }
    }
}
