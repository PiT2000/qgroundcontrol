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

void TsuruManager::startMission()
{
    qDebug()<<"START";
}

void TsuruManager::pauseMission()
{
    qDebug()<<"PAUSE";
}

void TsuruManager::abortMission()
{
    qDebug()<<"ABOTR";
}

void TsuruManager::goToLand()
{
    qDebug()<<"GO TO LAND";
}

void TsuruManager::screenShot()
{
    qDebug()<<"SCREENHOOT";
}

void TsuruManager::setServo(int chanel, float aux)
{
//    qDebug()<<chanel<<aux;
    Vehicle *_activeVehicle = _toolbox->multiVehicleManager()->activeVehicle();
    mavlink_set_actuator_control_target_t packet = {
        93372036854775807ULL,
        {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        2,
        _activeVehicle->id(),
        _activeVehicle->defaultComponentId()
    };
    packet.controls[chanel] = aux;
    mavlink_message_t msg;
    mavlink_msg_set_actuator_control_target_encode(_toolbox->mavlinkProtocol()->getSystemId(),
                                                   _activeVehicle->defaultComponentId(),
                                                   &msg,
                                                   &packet );
    _activeVehicle->sendMessageOnLink(_activeVehicle->priorityLink(), msg);
    qDebug()<<packet.controls[0];
    mavlink_set_actuator_control_target_t packet1;
    mavlink_msg_set_actuator_control_target_decode(&msg, &packet1);
    qDebug()<<packet.controls[0]<<packet1.controls[0];
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


