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

    Q_PROPERTY( QStringList portNameList READ portNameList  NOTIFY portNameListChanged )

    QStringList portNameList (void);

private:
    QStringList _portNameList;

public slots:

signals:
    void portNameListChanged (QStringList list);
};

#endif // WEATHERSTATIONSETTINGSCONTROLLER_H
