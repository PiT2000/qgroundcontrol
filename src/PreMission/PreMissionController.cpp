#include "PreMissionController.h"

PreMissionController::PreMissionController(QObject *parent)
    : QObject(parent)
    , _preMissionPath(QDir::currentPath()+"/missions/")
{

}

PreMissionController::~PreMissionController()
{

}

void PreMissionController::loadFileList()
{
    QDir dir = QDir(QDir::currentPath()+"/missions/");
    dir.setNameFilters(QStringList("*.mission"));
    _fileList = dir.entryList();
    _preMissionPath = dir.path();
    qDebug()<<_preMissionPath;
}

