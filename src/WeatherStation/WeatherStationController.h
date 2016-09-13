#ifndef WEATHERSTATIONCONTROLLER_H
#define WEATHERSTATIONCONTROLLER_H

#include <QObject>

#include <QSerialPort>
#include <QSerialPortInfo>

class WeatherStationController : public QObject
{
    Q_OBJECT
public:
    WeatherStationController(QObject *parent = 0);
    ~WeatherStationController();

    Q_PROPERTY( qreal temperature        READ temperature        WRITE setTemperature       NOTIFY temperatureChanged      )
    Q_PROPERTY( qreal pressure           READ pressure           WRITE setPressure          NOTIFY pressureChanged         )
    Q_PROPERTY( qreal relativeHumidity   READ relativeHumidity   WRITE setRelativeHumidity  NOTIFY relativeHumidityChanged )
    Q_PROPERTY( qreal precipitation      READ precipitation      WRITE setPrecipitation     NOTIFY precipitationChanged    )
    Q_PROPERTY( qreal windDirection      READ windDirection      WRITE setWindDirection     NOTIFY windDirectionChanged    )
    Q_PROPERTY( qreal windSpeed          READ windSpeed          WRITE setWindSpeed         NOTIFY windSpeedChanged        )

    qreal temperature       (void) { return _temperature;      }
    qreal pressure          (void) { return _pressure;         }
    qreal relativeHumidity  (void) { return _relativeHumidity; }
    qreal precipitation     (void) { return _precipitation;    }
    qreal windDirection     (void) { return _windDirection;    }
    qreal windSpeed         (void) { return _windSpeed;        }




private:
    qreal _temperature;
    qreal _pressure;
    qreal _relativeHumidity;
    qreal _precipitation;
    qreal _windDirection;
    qreal _windSpeed;

    QString _portName;

    QSerialPort *_port;



public slots:
    void setTemperature     ( qreal values ) { _temperature         = values; }
    void setPressure        ( qreal values ) { _pressure            = values; }
    void setRelativeHumidity( qreal values ) { _relativeHumidity    = values; }
    void setPrecipitation   ( qreal values ) { _precipitation       = values; }
    void setWindDirection   ( qreal values ) { _windDirection       = values; }
    void setWindSpeed       ( qreal values ) { _windSpeed           = values; }

signals:
    void temperatureChanged     ( qreal values );
    void pressureChanged        ( qreal values );
    void relativeHumidityChanged( qreal values );
    void precipitationChanged   ( qreal values );
    void windDirectionChanged   ( qreal values );
    void windSpeedChanged       ( qreal values );
};

#endif // WEATHERSTATIONCONTROLLER_H
