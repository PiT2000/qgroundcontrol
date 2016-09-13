#include "WeatherStationSettingsController.h"

WeatherStationSettingsController::WeatherStationSettingsController(QObject *parent) : QObject(parent)
{

}

WeatherStationSettingsController::~WeatherStationSettingsController()
{

}


QStringList WeatherStationSettingsController::portNameList()
{
    _portNameList.clear();
    _portNameList.append("Select Port");
    QList<QSerialPortInfo> list = QSerialPortInfo::availablePorts();
    foreach ( QSerialPortInfo info, list)
    {
        _portNameList.append(info.portName());
    }
     return _portNameList;
}
