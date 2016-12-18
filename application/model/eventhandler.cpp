#include "eventhandler.h"


EventHandler::EventHandler(QObject *parent) : QObject(parent)
{
    // Register to connectionManager for information about connection
    connect(&ConnectionManager::GetInstance(), SIGNAL(peerConnected()), this, SLOT(peerIsConnected()));
}

void EventHandler::connectionInitiated(QString ip, QString port)
{
    //if peer is already connected ignore and return message
    if (ConnectionManager::GetInstance().isPeerConnected())
    {
       emit connectionMessage("You are already connected to: " + ConnectionManager::GetInstance().getPeerAddress().toString() );
    }
    //if peer is not connected try to connect
    else
    {
        emit connectionMessage("Waiting for approval from " + ip + ":" + port);
        bool isConnected = ConnectionManager::GetInstance().connectToPeer(ip, port.toInt());
        if(!isConnected)
        {
            emit connectionMessage("Failed to connect!");
        }
    }
}

void EventHandler::waitForConnections()
{
    ConnectionManager::GetInstance().startListening(4001);
    emit connectionMessage("Waiting for player connection");
}

void EventHandler::peerIsConnected()
{
    emit connectionMessage("Player is connected");
}
