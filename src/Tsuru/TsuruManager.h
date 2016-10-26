#ifndef TSURUMANAGER_H
#define TSURUMANAGER_H

#include <QObject>
#include <QDebug>
#include "QGCToolbox.h"

class TsuruManager : public QGCTool
{
    Q_OBJECT
public:
    Q_ENUMS( TsuruState )
    explicit TsuruManager(QGCApplication* app);
    ~TsuruManager();
    //-- Constant property
    Q_PROPERTY( bool isEditor READ isEditor CONSTANT    )
    //
    Q_PROPERTY( QString missionPath READ missionPath    WRITE setMissionPath    NOTIFY missionPathChanged   )
    //Camera controll
    Q_PROPERTY( float cameraPitch   READ cameraPitch    WRITE setCameraPitch    NOTIFY cameraPitchChanged   )
    Q_PROPERTY( float cameraYaw     READ cameraYaw      WRITE setCameraYaw      NOTIFY cameraYawChanged     )
    Q_PROPERTY( float cameraZoom    READ cameraZoom     WRITE setCameraZoom     NOTIFY cameraZoomChanged    )
    Q_PROPERTY( float cameraChanel  READ cameraChanel   WRITE setCameraChanel   NOTIFY cameraChanelChanged  )

    Q_INVOKABLE void setServo(int chanel, float aux);
    Q_INVOKABLE void setCameraAUX();

    bool isEditor(void) { return _isEditor; }

    QString missionPath (void) { return _missionPath;   }
    float cameraPitch   (void) { return _cameraPitch;   }
    float cameraYaw     (void) { return _cameraYaw;     }
    float cameraZoom    (void) { return _cameraZoom;    }
    float cameraChanel  (void) { return _cameraChanel;  }

    // Override from QGCTool
    void setToolbox(QGCToolbox *toolbox);
public slots:
    void setMissionPath (QString value);
    void setCameraPitch (float value);
    void setCameraYaw   (float value);
    void setCameraZoom  (float value);
    void setCameraChanel(float value);

private:
    bool _isEditor;
    QString _missionPath;
    QGCToolbox* _toolbox;
    float *_cameraState[8];
    float _cameraPitch;
    float _cameraYaw;
    float _cameraZoom;
    float _cameraChanel;
signals:
    void missionPathChanged (QString value);
    void cameraPitchChanged (float value);
    void cameraYawChanged   (float value);
    void cameraZoomChanged  (float value);
    void cameraChanelChanged(float value);
};

#endif // TSURUMANAGER_H
