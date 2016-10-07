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
    _toolbox->multiVehicleManager()->activeVehicle()->setFlightMode("Mission");
    _toolbox->multiVehicleManager()->activeVehicle()->setArmed(true);
}

void TsuruManager::pauseMission()
{
    qDebug()<<"PAUSE";
    _toolbox->multiVehicleManager()->activeVehicle()->setFlightMode("Hold");
}

void TsuruManager::abortMission()
{
    qDebug()<<"ABOTR";
    _toolbox->multiVehicleManager()->activeVehicle()->setFlightMode("Return");
}

void TsuruManager::goToLand()
{
    qDebug()<<"GO TO LAND";
    _toolbox->multiVehicleManager()->activeVehicle()->setFlightMode("Land");
}

void TsuruManager::screenShot()
{
    qDebug()<<"SCREENHOOT";
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


