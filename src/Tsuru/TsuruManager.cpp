#include <QQmlContext>
#include <QQmlEngine>
#include <QSettings>

#include "ScreenToolsController.h"
#include "TsuruManager.h"

TsuruManager::TsuruManager(QGCApplication* app)
    : QGCTool(app)
    , _isEditor(false)
    , _missionPath("")
    , _toolbox(NULL)
{
    foreach ( QString str, app->arguments() )
    {
        if( str == "--editor" )
            _isEditor = true;
    }
    QSettings settings;
    settings.beginGroup("TSURU");
    _missionPath = settings.value("MissionPath", QDir::homePath()+"/missions/" ).toString();
}

TsuruManager::~TsuruManager()
{

}

void TsuruManager::setServo(int chanel, float aux)
{
    Vehicle *_activeVehicle = _toolbox->multiVehicleManager()->activeVehicle();
    if(!_activeVehicle) return;
    mavlink_set_actuator_control_target_t packet = {
        93372036854775807ULL,
        {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        2,
        _activeVehicle->id(),
        _activeVehicle->defaultComponentId()
    };
    packet.controls[chanel] = (float)aux;
    mavlink_message_t msg;
    mavlink_msg_set_actuator_control_target_encode(_toolbox->mavlinkProtocol()->getSystemId(),
                                                   _activeVehicle->defaultComponentId(),
                                                   &msg,
                                                   &packet );
    _activeVehicle->sendMessageOnLink(_activeVehicle->priorityLink(), msg);
}

void TsuruManager::setCameraAUX()
{
    Vehicle *_activeVehicle = _toolbox->multiVehicleManager()->activeVehicle();
    mavlink_set_actuator_control_target_t packet = {
        93372036854775807ULL,
        {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        2,
        _activeVehicle->id(),
        _activeVehicle->defaultComponentId()
    };
    memcpy(packet.controls, _cameraState, sizeof(_cameraState));
    mavlink_message_t msg;
    mavlink_msg_set_actuator_control_target_encode(_toolbox->mavlinkProtocol()->getSystemId(),
                                                   _activeVehicle->defaultComponentId(),
                                                   &msg,
                                                   &packet );
    _activeVehicle->sendMessageOnLink(_activeVehicle->priorityLink(), msg);
}

void TsuruManager::setToolbox(QGCToolbox *toolbox)
{
    QGCTool::setToolbox(toolbox);
    QQmlEngine::setObjectOwnership(this, QQmlEngine::CppOwnership);
    qmlRegisterUncreatableType<TsuruManager>("QGroundControl.TsuruManager", 1, 0, "TsuruManager", "Reference only");
    _toolbox = toolbox;
}

void TsuruManager::setMissionPath(QString value)
{
    QSettings settings;
    settings.beginGroup("TSURU");
    settings.setValue("MissionPath", value);
    _missionPath = value;
    emit missionPathChanged(value);
}

void TsuruManager::setCameraPitch(float value)
{
    if(value <-1)
    {

    }

    _cameraPitch = value;
    emit cameraPitchChanged (_cameraPitch);
}

void TsuruManager::setCameraYaw(float value)
{
    _cameraYaw       = value;
    emit cameraYawChanged   (_cameraYaw);
}

void TsuruManager::setCameraZoom(float value)
{
    _cameraZoom      = value;
    emit cameraZoomChanged  (_cameraZoom);
}

void TsuruManager::setCameraChanel(float value)
{
    _cameraChanel    = value;
    emit cameraChanelChanged(_cameraChanel);
}


