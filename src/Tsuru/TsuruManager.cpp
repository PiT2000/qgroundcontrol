#include <QQmlContext>
#include <QQmlEngine>
#include <QSettings>

#include "ScreenToolsController.h"
#include "TsuruManager.h"

TsuruManager::TsuruManager(QGCApplication* app)
    : QGCTool(app)
    , _isEditor(false)
{

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
