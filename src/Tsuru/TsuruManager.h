#ifndef TSURUMANAGER_H
#define TSURUMANAGER_H

#include <QObject>
#include "QGCToolbox.h"

class TsuruManager : public QGCTool
{
    Q_OBJECT
public:
    explicit TsuruManager(QGCApplication* app);
    ~TsuruManager();

public slots:

private:

signals:

};

#endif // TSURUMANAGER_H
