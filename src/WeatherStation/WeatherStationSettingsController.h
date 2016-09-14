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

    Q_PROPERTY( QString portName READ portName WRITE setPortName NOTIFY portNameChanged)


    Q_PROPERTY( QStringList portNameList READ portNameList NOTIFY portNameListChanged )

    QString     portName        (void) { return _portName; }
    QStringList portNameList    (void);

private:
    QString     _portName;
    QStringList _portNameList;

public slots:
    void setPortName( QString values ) { _portName = values; }

signals:
    void portNameChanged     ( QString      str );
    void portNameListChanged ( QStringList  list );
};

#endif // WEATHERSTATIONSETTINGSCONTROLLER_H
