#ifndef WEATHERSTATIONCONTROLLER_H
#define WEATHERSTATIONCONTROLLER_H

#include <QObject>

class WeatherStationController : public QObject
{
    Q_OBJECT
public:
    WeatherStationController(QObject *parent = 0);
    ~WeatherStationController();

signals:

public slots:
};

#endif // WEATHERSTATIONCONTROLLER_H
