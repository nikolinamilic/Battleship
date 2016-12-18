#include "eventhandler.h"


EventHandler::EventHandler(QObject *parent) : QObject(parent)
{

}

void EventHandler::connect(QString ip, QString port)
{
    //if peer is already connected ignore and return message
    if (ConnectionManager::GetInstance()->isPeerConnected())
    {

       emit connectionMessage("You are already connected to: " + ConnectionManager::GetInstance()->getPeerAddress().toString() );
    }
    //if peer is not connected try to connect
    else
    {
        emit connectionMessage("Waiting for approval from " + ip + ":" + port);
        //bool isConnected = ConnectionManager::GetInstance()->connectToPeer(ip, port.toInt());
    }

}
