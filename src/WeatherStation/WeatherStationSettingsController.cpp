#include <QSettings>
#include "WeatherStationSettingsController.h"

WeatherStationSettingsController::WeatherStationSettingsController(QObject *parent)
    : QObject(parent)
    , _temperatureMax(25.0)
    , _temperatureMin(0.0)
    , _precipitationMax(15.0)
    , _windSpeedMax(8.0)
{
    QSettings settings;
    settings.beginGroup("WEATHER_STATION");
    _temperatureMax     = settings.value("temperatureMax", 25.0).toReal();
    _temperatureMin     = settings.value("temperatureMin", 0.0).toReal();
    _precipitationMax   = settings.value("precipitationMax", 15.0).toReal();
    _windSpeedMax       = settings.value("windSpeedMax", 8.0).toReal();
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

void WeatherStationSettingsController::setTemperatureMax(qreal values)
{
    if(values >= -25.0 && values <= 50)
    {
        _temperatureMax = values;
        QSettings settings;
        settings.beginGroup("WEATHER_STATION");
        settings.setValue("temperatureMax", values);
        emit temperatureMaxChanged(values);
    }
}

void WeatherStationSettingsController::setTemperatureMin(qreal values)
{
    if(values >= -25.0 && values <= 50)
    {
        _temperatureMin = values;
        QSettings settings;
        settings.beginGroup("WEATHER_STATION");
        settings.setValue("temperatureMin", values);
        emit temperatureMinChanged(values);
    }
}

void WeatherStationSettingsController::setPrecipitationMax(qreal values)
{
    if(values >= -25.0 && values <= 50)
    {
        _precipitationMax = values;
        QSettings settings;
        settings.beginGroup("WEATHER_STATION");
        settings.setValue("precipitationMax", values);
        emit precipitationMaxChanged(values);
    }
}

void WeatherStationSettingsController::setWindSpeedMax(qreal values)
{
    if(values >= -25.0 && values <= 50)
    {
        _windSpeedMax = values;
        QSettings settings;
        settings.beginGroup("WEATHER_STATION");
        settings.setValue("windSpeedMax", values);
        emit windSpeedMaxChanged(values);
    }
}
