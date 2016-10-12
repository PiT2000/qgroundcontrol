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

void TsuruManager::setServo(float servo, float pwm)
{
    qDebug()<<servo<<pwm;
    Vehicle *_activeVehicle = _toolbox->multiVehicleManager()->activeVehicle();
    _activeVehicle->doCommandLong(_activeVehicle->defaultComponentId(), MAV_CMD_DO_SET_SERVO, servo, pwm);
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


