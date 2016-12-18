import QtQuick 2.5
import QtQuick.Controls 2.0

Item {

    Text {
        id: connectionText
        x: parent.width/2
        y: parent.height/5*1
        text: "Not connected..."
        Connections {
            target: eventHandler
            ignoreUnknownSignals: true
            // creating slot: on<SignalName>
            // reference signal parameter by name in C++ backend (e.g. message)
            onConnectionMessage: {
                connectionText.text = message;
            }
        }
    }

    TextField {
        id: peerAddressField
        x: parent.width/2
        y: parent.height/5*2
        text: "localhost"
    }

    TextField {
        id: peerPortField
        x: parent.width/2
        y: parent.height/5*3
        text: "4001"
    }

    Button {
        id: connectionButton
        x: parent.width/2
        y: parent.height/5*4
        text: "Connect"
        onClicked: {
            //gameScreen.visible = true;
            //welcomeScreen.visible = false;
            eventHandler.connect(peerAddressField.text, peerPortField.text)
        }
    }
}
