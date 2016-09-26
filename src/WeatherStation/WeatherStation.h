#ifndef WEATHERSTATION_H
#define WEATHERSTATION_H

#include <QObject>

class WeatherStation : public QObject
{
    Q_OBJECT
public:
    explicit WeatherStation(QObject *parent = 0);

signals:

public slots:
};

#endif // WEATHERSTATION_H