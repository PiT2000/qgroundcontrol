#ifndef TSURUMANAGER_H
#define TSURUMANAGER_H

#include <QObject>
#include <QDebug>
#include "QGCToolbox.h"

class TsuruManager : public QGCTool
{
    Q_OBJECT
public:
    explicit TsuruManager(QGCApplication* app);
    ~TsuruManager();
    //-- Constant property
    Q_PROPERTY(bool isEditor READ isEditor CONSTANT)
    //
    Q_PROPERTY(QString      missionPath READ missionPath WRITE setMissionPath NOTIFY missionPathChanged)

    Q_INVOKABLE void startMission();
    Q_INVOKABLE void pauseMission();
    Q_INVOKABLE void abortMission();
    Q_INVOKABLE void goToLand();
    Q_INVOKABLE void screenShot();

    bool isEditor(void) { return _isEditor; }

    QString missionPath() { return _missionPath; }


    // Override from QGCTool
    void setToolbox(QGCToolbox *toolbox);

public slots:
    void setMissionPath(QString value);

private:
    bool _isEditor;
    QString _missionPath;
    QGCToolbox* _toolbox;

signals:
    void missionPathChanged(QString value);
};

#endif // TSURUMANAGER_H
