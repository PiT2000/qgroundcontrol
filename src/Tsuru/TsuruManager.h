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
    Q_PROPERTY(bool isEditor READ isEditor CONSTANT)

    bool isEditor(void) { return _isEditor; }

    // Override from QGCTool
    void setToolbox(QGCToolbox *toolbox);

public slots:

private:
    bool _isEditor;

signals:

};

#endif // TSURUMANAGER_H
