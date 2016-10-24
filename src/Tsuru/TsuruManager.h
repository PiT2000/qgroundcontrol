#ifndef TSURUMANAGER_H
#define TSURUMANAGER_H

#include <QObject>
#include <QDebug>
#include "QGCToolbox.h"

class TsuruManager : public QGCTool
{
    Q_OBJECT
public:
    enum TsuruState {
        Home = 0,
        Mission = 1,
        Hold = 2,
        GoToHome = 3,
        GoToLand = 4,
        MSelected = 5
    };
    Q_ENUMS( TsuruState )
    explicit TsuruManager(QGCApplication* app);
    ~TsuruManager();
    //-- Constant property
    Q_PROPERTY(bool isEditor READ isEditor CONSTANT)
    //
    Q_PROPERTY(QString      missionPath READ missionPath    WRITE setMissionPath    NOTIFY missionPathChanged)
    Q_PROPERTY(TsuruState   state       READ state          WRITE setState          NOTIFY stateChanged)

    Q_INVOKABLE void startMission();
    Q_INVOKABLE void pauseMission();
    Q_INVOKABLE void abortMission();
    Q_INVOKABLE void goToLand();
    Q_INVOKABLE void screenShot();
    Q_INVOKABLE void setServo(int chanel, float aux);

    bool isEditor(void) { return _isEditor; }

    QString missionPath(void) { return _missionPath; }
    TsuruState state(void) { return _state; }



    // Override from QGCTool
    void setToolbox(QGCToolbox *toolbox);

public slots:
    void setMissionPath(QString value);
    void setState(TsuruState value) { _state = value; stateChanged(value); }

private:
    bool _isEditor;
    QString _missionPath;
    TsuruState _state;
    QGCToolbox* _toolbox;

signals:
    void missionPathChanged(QString value);
    void stateChanged(TsuruState value);
};

#endif // TSURUMANAGER_H
