#ifndef EVENTHANDLER_H
#define EVENTHANDLER_H

#include <QObject>
#include "connectionmanager.h"

class EventHandler : public QObject
{
    Q_OBJECT
public:
    explicit EventHandler(QObject *parent = 0);

private:

signals:
     void connectionMessage(QString message);

public slots:
    //ConnectionManager
    void peerIsConnected ();

    //QML
    void connectionInitiated(QString ip, QString port);
    void waitForConnections();

};

#endif // EVENTHANDLER_H
