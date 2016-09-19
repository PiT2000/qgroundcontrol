#ifndef WEATHERSTATIONSETTINGSCONTROLLER_H
#define WEATHERSTATIONSETTINGSCONTROLLER_H

#include <QObject>
#include <QSerialPort>
#include <QSerialPortInfo>

class WeatherStationSettingsController : public QObject
{
    Q_OBJECT
public:
    WeatherStationSettingsController(QObject *parent = 0);
    ~WeatherStationSettingsController();

    //Port
    Q_PROPERTY( QString portName        READ portName           WRITE setPortName           NOTIFY portNameChanged)
    //Critcal meteo
    Q_PROPERTY( qreal temperatureMax    READ temperatureMax     WRITE setTemperatureMax     NOTIFY temperatureMaxChanged )
    Q_PROPERTY( qreal temperatureMin    READ temperatureMin     WRITE setTemperatureMin     NOTIFY temperatureMinChanged)
    Q_PROPERTY( qreal precipitationMax  READ precipitationMax   WRITE setPrecipitationMax   NOTIFY precipitationMaxChanged)
    Q_PROPERTY( qreal windSpeedMax      READ windSpeedMax       WRITE setWindSpeedMax       NOTIFY windSpeedMaxChanged)

    Q_PROPERTY( QStringList portNameList READ portNameList NOTIFY portNameListChanged )

    QString     portName        (void) { return _portName; }
    QStringList portNameList    (void);

    qreal temperatureMax    (void) { return _temperatureMax;    }
    qreal temperatureMin    (void) { return _temperatureMin;    }
    qreal precipitationMax  (void) { return _precipitationMax;  }
    qreal windSpeedMax      (void) { return _windSpeedMax;      }

private:
    QString     _portName;
    QStringList _portNameList;

    qreal _temperatureMax;
    qreal _temperatureMin;
    qreal _precipitationMax;
    qreal _windSpeedMax;

public slots:
    void setPortName        ( QString values );

    void setTemperatureMax  (qreal values);
    void setTemperatureMin  (qreal values);
    void setPrecipitationMax(qreal values);
    void setWindSpeedMax    (qreal values);

signals:
    void portNameChanged     ( QString      str );
    void portNameListChanged ( QStringList  list );

    void temperatureMaxChanged      ( qreal values );
    void temperatureMinChanged      ( qreal values );
    void precipitationMaxChanged    ( qreal values );
    void windSpeedMaxChanged        ( qreal values );
};

#endif // WEATHERSTATIONSETTINGSCONTROLLER_H
