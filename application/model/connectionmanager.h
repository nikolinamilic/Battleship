#ifndef CONNECTIONMANAGER_H
#define CONNECTIONMANAGER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QSharedPointer>

class ConnectionManager : public QObject
{
    Q_OBJECT
public:
    explicit ConnectionManager(QObject *parent = 0);

    bool isHostListening() const { return server.isListening(); }
    bool startListening(quint16 port);
    void stopListening();

    QHostAddress getHostAddress() const;
    qint16 getHostPort() const;

    bool isPeerConnected() const { return peerIsConnected; }
    bool connectToPeer(QString hostName, quint16 port);
    void disconnectPeer();

    QHostAddress getPeerAddress() const;
    QString getPeerName() const;
    qint16 getPeerPort() const;

    qint64 sendMessage(const QString &message);

signals:
    void peerConnected();
    void peerDisconnected();
    void receivedMessage(const QString &message);

private:
    QTcpServer server;
    QSharedPointer<QTcpSocket> peer;
    bool peerIsConnected;

private slots:
    void hostNewConnection();
    void peerDataReady();
    void peerDisconnect();
};

#endif // CONNECTIONMANAGER_H
