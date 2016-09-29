#include <QQmlContext>
#include <QQmlEngine>
#include <QSettings>

#include "ScreenToolsController.h"
#include "TsuruManager.h"

TsuruManager::TsuruManager(QGCApplication* app)
    : QGCTool(app)
    , _isEditor(false)
    , _missionPath("")
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

void TsuruManager::setToolbox(QGCToolbox *toolbox)
{
    QGCTool::setToolbox(toolbox);
    QQmlEngine::setObjectOwnership(this, QQmlEngine::CppOwnership);
    qmlRegisterUncreatableType<TsuruManager>("QGroundControl.TsuruManager", 1, 0, "TsuruManager", "Reference only");
}

void TsuruManager::setMissionPath(QString value)
{
    QSettings settings;
    settings.beginGroup("TSURU");
    settings.setValue("MissionPath", value);
    _missionPath = value;
    emit missionPathChanged(value);
}


