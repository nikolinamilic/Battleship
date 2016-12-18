#include "connectionmanager.h"

#include <QDebug>

ConnectionManager* ConnectionManager::cmInstance = NULL;

ConnectionManager::ConnectionManager(QObject *parent) : QObject(parent), peerIsConnected(false)
{
    // Register to server signal for new connections
    connect(&server, SIGNAL(newConnection()), this, SLOT(hostNewConnection()));
}

ConnectionManager *ConnectionManager::GetInstance()
{
    if(cmInstance == NULL)
    {
        cmInstance = new ConnectionManager();
    }
    else
    {
        return cmInstance;
    }
}

bool ConnectionManager::startListening(quint16 port)
{
    // Start listening for new connections on any network interface
    return server.listen(QHostAddress::Any, port);
}

void ConnectionManager::stopListening()
{
    server.close();
}

QHostAddress ConnectionManager::getHostAddress() const
{
    return server.serverAddress();
}

qint16 ConnectionManager::getHostPort() const
{
    return server.serverPort();
}

bool ConnectionManager::connectToPeer(QString hostName, quint16 port)
{
    // Disconnect peer if connected
    if (peerIsConnected)
    {
        disconnectPeer();
    }
    // Initiate connection and wait for response
    peer.reset(new QTcpSocket());
    peer->connectToHost(hostName, port);
    if (peer->waitForConnected())
    {
        peerIsConnected = true;
    }
    return peerIsConnected;
}

void ConnectionManager::disconnectPeer()
{
    // Close peer socket
    peer->close();
    // Update peer status
    peerIsConnected = false;
}

QHostAddress ConnectionManager::getPeerAddress() const
{
    return peerIsConnected ? peer->peerAddress() : QHostAddress::Null;
}

QString ConnectionManager::getPeerName() const
{
    return peerIsConnected ? peer->peerName() : QString("");
}

qint16 ConnectionManager::getPeerPort() const
{
    return peerIsConnected ? peer->peerPort() : 0;
}

qint64 ConnectionManager::sendMessage(const QString &message)
{
    qint64 written = 0;
    // Send message only if peer is connected
    if (!peer.isNull() && peer->state() != QAbstractSocket::UnconnectedState)
    {
        // Convert QString to UTF8 byte array before sending
        written = peer->write(message.toUtf8());
        peer->flush();
    }
    return written;
}

void ConnectionManager::hostNewConnection()
{
    // Accept only one connection, reject others
    if (peerIsConnected)
    {
        // Use a temporary socket for rejecting peer
        QSharedPointer<QTcpSocket> rejectedPeer(server.nextPendingConnection());
        // Send a reject message to peer
        rejectedPeer->write("Not available right now...");
        rejectedPeer->flush();
        rejectedPeer->close();
    }
    else
    {
        peer.reset(server.nextPendingConnection());
        // Register to peer socket signals
        connect(peer.data(), SIGNAL(readyRead()), this, SLOT(peerDataReady()));
        connect(peer.data(), SIGNAL(disconnected()), this, SLOT(peerDisconnect()));
        // Update peer status
        peerIsConnected = true;
        emit peerConnected();

        // FIXME: Send a welcome message to peer
        peer->write("Welcome peer!");
        peer->flush();
    }
}

void ConnectionManager::peerDataReady()
{
    QString message(peer->readAll());
    qDebug() << "peer said: " << message;
    qDebug() << "peer info: " << getPeerAddress() << " " << getPeerName() << " " << getPeerPort();
    emit receivedMessage(message);
}

void ConnectionManager::peerDisconnect()
{
    qDebug() << "peer disconnected!";
    // Call dedicated disconnect function
    disconnectPeer();
    // Emit disconnect signal
    emit peerDisconnected();
}
