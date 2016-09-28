#ifndef WEATHERSTATION_H
#define WEATHERSTATION_H

#include <QObject>
#include <QSettings>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QTimer>

#include "QGCLoggingCategory.h"
#include "QGCToolbox.h"

class WeatherStation : public QGCTool
{
    Q_OBJECT
public:
    WeatherStation(QGCApplication* app);
    ~WeatherStation();

    //Свойства телеметрии
    Q_PROPERTY( qreal temperature       READ temperature        WRITE setTemperature        NOTIFY temperatureChanged      )
    Q_PROPERTY( qreal pressure          READ pressure           WRITE setPressure           NOTIFY pressureChanged         )
    Q_PROPERTY( qreal relativeHumidity  READ relativeHumidity   WRITE setRelativeHumidity   NOTIFY relativeHumidityChanged )
    Q_PROPERTY( qreal precipitation     READ precipitation      WRITE setPrecipitation      NOTIFY precipitationChanged    )
    Q_PROPERTY( qreal windDirection     READ windDirection      WRITE setWindDirection      NOTIFY windDirectionChanged    )
    Q_PROPERTY( qreal windSpeed         READ windSpeed          WRITE setWindSpeed          NOTIFY windSpeedChanged        )
    //Свойства предельных значений
    Q_PROPERTY( qreal temperatureMax    READ temperatureMax     WRITE setTemperatureMax     NOTIFY temperatureMaxChanged   )
    Q_PROPERTY( qreal temperatureMin    READ temperatureMin     WRITE setTemperatureMin     NOTIFY temperatureMinChanged   )
    Q_PROPERTY( qreal precipitationMax  READ precipitationMax   WRITE setPrecipitationMax   NOTIFY precipitationMaxChanged )
    Q_PROPERTY( qreal windSpeedMax      READ windSpeedMax       WRITE setWindSpeedMax       NOTIFY windSpeedMaxChanged     )
    //Свойства разрешений вылета
    Q_PROPERTY( bool  flightResolved    READ flightResolved     WRITE setFlightResolved     NOTIFY flightResolvedChanged   )
    Q_PROPERTY( bool  temperatureWar    READ temperatureWar     WRITE setTemperatureWar     NOTIFY temperatureWarChanged   )
    Q_PROPERTY( bool  precipitationWar  READ precipitationWar   WRITE setPrecipitationWar   NOTIFY precipitationWarChanged )
    Q_PROPERTY( bool  windSpeedWar      READ windSpeedWar       WRITE setWindSpeedWar       NOTIFY windSpeedWarChanged     )
    //Свойства порта
    Q_PROPERTY( QString portName        READ portName           WRITE setPortName           NOTIFY portNameChanged         )
    Q_PROPERTY( QString portError       READ portError          WRITE setPortError          NOTIFY portErrorChanged        )
    Q_PROPERTY( bool    portReady       READ portReady          WRITE setPortReady          NOTIFY portReadyChanged        )

    Q_PROPERTY( QStringList portList    READ portList           NOTIFY portListChanged )


    //Получение свойств телеметрии
    qreal       temperature     (void) { return _temperature;      }
    qreal       pressure        (void) { return _pressure;         }
    qreal       relativeHumidity(void) { return _relativeHumidity; }
    qreal       precipitation   (void) { return _precipitation;    }
    qreal       windDirection   (void) { return _windDirection;    }
    qreal       windSpeed       (void) { return _windSpeed;        }
    //Свойства предельных значений
    qreal       temperatureMax  (void) { return _temperatureMax;   }
    qreal       temperatureMin  (void) { return _temperatureMin;   }
    qreal       precipitationMax(void) { return _precipitationMax; }
    qreal       windSpeedMax    (void) { return _windSpeedMax;     }
    //Свойства разрешений вылета
    bool        flightResolved  (void) { return _flightResolved;   }
    bool        temperatureWar  (void) { return _temperatureWar;   }
    bool        precipitationWar(void) { return _precipitationWar; }
    bool        windSpeedWar    (void) { return _windSpeedWar;     }
    //ПОлучение свойств порта
    QString     portName        (void) { return _portName;  }
    QString     portError       (void) { return _portError; }
    bool        portReady       (void) { return _portReady; }

    QStringList portList        (void);

    // Override from QGCTool
    void        setToolbox          (QGCToolbox *toolbox);

public slots:
    //Установка свойств телеметрии
    void setTemperature     ( qreal value ) { _temperature          = value; emit temperatureChanged        ( value );}
    void setPressure        ( qreal value ) { _pressure             = value; emit pressureChanged           ( value );}
    void setRelativeHumidity( qreal value ) { _relativeHumidity     = value; emit relativeHumidityChanged   ( value );}
    void setPrecipitation   ( qreal value ) { _precipitation        = value; emit precipitationChanged      ( value );}
    void setWindDirection   ( qreal value ) { _windDirection        = value; emit windDirectionChanged      ( value );}
    void setWindSpeed       ( qreal value ) { _windSpeed            = value; emit windSpeedChanged          ( value );}
    //Установка предельных значений
    void setTemperatureMax  ( qreal value );
    void setTemperatureMin  ( qreal value );
    void setPrecipitationMax( qreal value );
    void setWindSpeedMax    ( qreal value );
    //Установка разрешений вылета
    void setFlightResolved  ( qreal value ) { _flightResolved       = value; emit flightResolvedChanged (value);}
    void setTemperatureWar  ( qreal value ) { _temperatureWar       = value; emit temperatureWarChanged (value);}
    void setPrecipitationWar( qreal value ) { _precipitationWar     = value; emit precipitationWarChanged(value);}
    void setWindSpeedWar    ( qreal value ) { _windSpeedWar         = value; emit windSpeedWarChanged   (value);}
    //Установка свойств порта
    void setPortName        ( QString value );
    void setPortError       ( QString value ) { _portError    = value; emit portErrorChanged      ( value );}
    void setPortReady       ( bool    value ) { _portReady    = value; emit portReadyChanged      ( value );}

    //Рабочие слоты
    void openPort(void); //Открытие порта
    void readData(void); //Чтение данных

signals:
    //Сигналы об изменении свойств телеметрии
    void temperatureChanged     ( qreal value );
    void pressureChanged        ( qreal value );
    void relativeHumidityChanged( qreal value );
    void precipitationChanged   ( qreal value );
    void windDirectionChanged   ( qreal value );
    void windSpeedChanged       ( qreal value );
    //Сигналы об изменении предельных значений
    void temperatureMaxChanged  ( qreal value );
    void temperatureMinChanged  ( qreal value );
    void precipitationMaxChanged( qreal value );
    void windSpeedMaxChanged    ( qreal value );
    //Сигналы об изменении разрешений вылета
    void flightResolvedChanged  ( qreal value );
    void temperatureWarChanged  ( qreal value );
    void precipitationWarChanged( qreal value );
    void windSpeedWarChanged    ( qreal value );
    //Сигналы об изменении свойств порта
    void portNameChanged        ( QString value );
    void portErrorChanged       ( QString value );
    void portReadyChanged       ( bool    value );

    void portListChanged        ( QStringList value );

private:
    //Свойства телеметрии
    qreal       _temperature;
    qreal       _pressure;
    qreal       _relativeHumidity;
    qreal       _precipitation;
    qreal       _windDirection;
    qreal       _windSpeed;
    //Свойства предельных значений
    qreal       _temperatureMax;
    qreal       _temperatureMin;
    qreal       _precipitationMax;
    qreal       _windSpeedMax;
    //Свойства разрешений вылета
    bool        _flightResolved;
    bool        _temperatureWar;
    bool        _precipitationWar;
    bool        _windSpeedWar;
    //Свойства порта
    QString     _portName;
    QString     _portError;
    bool        _portReady;

    QStringList _portList;

    QSerialPort*    _port;//Ссылка на порт
    QByteArray      _bufer;//буфер
};

#endif // WEATHERSTATION_H
