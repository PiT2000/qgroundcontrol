#ifndef WEATHERSTATIONCONTROLLER_H
#define WEATHERSTATIONCONTROLLER_H

#include <QObject>
#include <QSettings>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QTimer>
#include <QDebug>

class WeatherStationController : public QObject
{
    Q_OBJECT
public:
    WeatherStationController(QObject *parent = 0);
    ~WeatherStationController();

    //Свойства телеметрии
    Q_PROPERTY( qreal temperature        READ temperature        WRITE setTemperature       NOTIFY temperatureChanged      )
    Q_PROPERTY( qreal pressure           READ pressure           WRITE setPressure          NOTIFY pressureChanged         )
    Q_PROPERTY( qreal relativeHumidity   READ relativeHumidity   WRITE setRelativeHumidity  NOTIFY relativeHumidityChanged )
    Q_PROPERTY( qreal precipitation      READ precipitation      WRITE setPrecipitation     NOTIFY precipitationChanged    )
    Q_PROPERTY( qreal windDirection      READ windDirection      WRITE setWindDirection     NOTIFY windDirectionChanged    )
    Q_PROPERTY( qreal windSpeed          READ windSpeed          WRITE setWindSpeed         NOTIFY windSpeedChanged        )
    //Свойства порта
    Q_PROPERTY( QString portName    READ portName   WRITE setPortName   NOTIFY portNameChanged  )
    Q_PROPERTY( QString portError   READ portError  WRITE setPortError  NOTIFY portErrorChanged )
    Q_PROPERTY( bool    readyRead   READ readyRead  WRITE setReadyRead  NOTIFY readyReadChanged )
    //Получение свойств телеметрии
    qreal temperature       (void) { return _temperature;      }
    qreal pressure          (void) { return _pressure;         }
    qreal relativeHumidity  (void) { return _relativeHumidity; }
    qreal precipitation     (void) { return _precipitation;    }
    qreal windDirection     (void) { return _windDirection;    }
    qreal windSpeed         (void) { return _windSpeed;        }
    //ПОлучение свойств порта
    QString portName  (void) { return _portName;  }
    QString portError (void) { return _portError; }
    bool    readyRead (void) { return _readyRead; }

public slots:
    //Установка свойств телеметрии
    void setTemperature     ( qreal value ) { _temperature         = value; emit temperatureChanged       ( value );}
    void setPressure        ( qreal value ) { _pressure            = value; emit pressureChanged          ( value );}
    void setRelativeHumidity( qreal value ) { _relativeHumidity    = value; emit relativeHumidityChanged  ( value );}
    void setPrecipitation   ( qreal value ) { _precipitation       = value; emit precipitationChanged     ( value );}
    void setWindDirection   ( qreal value ) { _windDirection       = value; emit windDirectionChanged     ( value );}
    void setWindSpeed       ( qreal value ) { _windSpeed           = value; emit windSpeedChanged         ( value );}
    //Установка свойств порта
    void setPortName    ( QString value ) { _portName  = value; emit portNameChanged    ( value );}
    void setPortError   ( QString value ) { _portError = value; emit portErrorChanged   ( value );}
    void setReadyRead   ( bool    value ) { _readyRead = value; emit readyReadChanged   ( value );}
    //Вспомогательные слоты
    void openPort(void);
    void readData(void);

signals:
    //Сигналы об изменении свойств телеметрии
    void temperatureChanged     ( qreal value );
    void pressureChanged        ( qreal value );
    void relativeHumidityChanged( qreal value );
    void precipitationChanged   ( qreal value );
    void windDirectionChanged   ( qreal value );
    void windSpeedChanged       ( qreal value );
    //Сигналы об изменении свойств порта
    void portNameChanged  ( QString value );
    void portErrorChanged ( QString value );
    void readyReadChanged ( bool    value );

private:
    //Свойства телеметрии
    qreal _temperature;
    qreal _pressure;
    qreal _relativeHumidity;
    qreal _precipitation;
    qreal _windDirection;
    qreal _windSpeed;
    //Свойства порта
    bool            _readyRead;
    QString         _portName;
    QString         _portError;
    QSerialPort*    _port;
    QByteArray      _bufer;
};

#endif // WEATHERSTATIONCONTROLLER_H
