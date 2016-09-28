#include <QQmlContext>
#include <QQmlEngine>
#include <QSettings>

#include "ScreenToolsController.h"

#include "WeatherStation.h"

WeatherStation::WeatherStation(QGCApplication* app)
    : QGCTool(app)
    , _temperature      (0)
    , _pressure         (0)
    , _relativeHumidity (0)
    , _precipitation    (0)
    , _windDirection    (0)
    , _windSpeed        (0)
    , _temperatureMax   (0)
    , _temperatureMin   (0)
    , _precipitationMax (0)
    , _windSpeedMax     (0)
    , _flightResolved   (false)
    , _temperatureWar   (false)
    , _precipitationWar (false)
    , _windSpeedWar     (false)
    , _portList         (NULL)
    , _portName         ("")
    , _portError        ("No error")
    , _portReady        (false)
    , _port             (NULL)
    , _bufer            (NULL)
{
    QSettings settings;
    settings.beginGroup("WEATHER_STATION");
    _portName           = settings.value("PortName", "").toString();
    _temperatureMax     = settings.value("temperatureMax", 25.0).toReal();
    _temperatureMin     = settings.value("temperatureMin", 0.0).toReal();
    _precipitationMax   = settings.value("precipitationMax", 15.0).toReal();
    _windSpeedMax       = settings.value("windSpeedMax", 8.0).toReal();

    _port = new QSerialPort;
    QTimer *timer = new QTimer;
    connect( timer, SIGNAL  ( timeout()  ),
             this,  SLOT    ( openPort() ));
    openPort();
    timer->start(1000);
}

WeatherStation::~WeatherStation()
{

}

void WeatherStation::setToolbox(QGCToolbox *toolbox)
{
    QGCTool::setToolbox(toolbox);
    QQmlEngine::setObjectOwnership(this, QQmlEngine::CppOwnership);
    qmlRegisterUncreatableType<WeatherStation>("QGroundControl.WeatherStation", 1, 0, "WeatherStation", "Reference only");
}

void WeatherStation::openPort()
{
    QSettings settings;
    settings.beginGroup("WEATHER_STATION");
    _portName = settings.value("PortName", _portName).toString();

    if(_port->isOpen())
    {//порт открыт
        if(_port->error() != QSerialPort::NoError)
        {//есть ошибки
            disconnect( _port,  SIGNAL  ( readyRead () ),
                        this,   SLOT    ( readData  () ));
            setPortError(  _portName+": "+_port->errorString() );
            setPortReady( false );
            _port->close();
        }
        if(_port->portName() != _portName)
        {
            disconnect( _port,  SIGNAL  ( readyRead () ),
                        this,   SLOT    ( readData  () ));
            setPortError(  _portName+": "+_port->errorString() );
            setPortReady( false );
            _port->close();
        }
    }
    else
    {//порт закрыт
        _port->readyRead();
        if(_portName != "")
        {//есть имя
            _port->close();
            _port->setPortName      ( _portName );
            _port->setBaudRate      ( QSerialPort::Baud9600 );
            _port->setDataBits      ( QSerialPort::Data8    );
            _port->setParity        ( QSerialPort::NoParity );
            _port->setStopBits      ( QSerialPort::OneStop  );
            _port->setFlowControl   ( QSerialPort::NoFlowControl );
            if( _port->open( QSerialPort::ReadWrite ) )
            {//порт открылся
                connect( _port, SIGNAL  ( readyRead  () ),
                         this,  SLOT    ( readData   () ));
                setPortError( "No error" );
                setPortReady(true);
            }
            else
            {//порт не открылся
                setPortError( _portName+": "+_port->errorString() );
                setPortReady(false);
            }
        }
        else
        {//нет имени
            setPortError( tr("Not selected port") );
            setPortReady(false);
        }
    }
}

void WeatherStation::readData()
{
    _bufer += _port->readAll();
    if(_bufer.size()<1 || _bufer[_bufer.size()-1] == '\n') {
        QStringList list = QString(_bufer).split(" ");
        if(list.count() >= 6) {
            setTemperature(list[0].toDouble());
            setPressure(list[1].toDouble());
            setRelativeHumidity(list[2].toDouble());
            setPrecipitation(list[3].toDouble());
            setWindDirection(list[4].toDouble());
            setWindSpeed(list[5].toDouble());
        }
        _bufer.clear();
    }
}


QStringList WeatherStation::portList()
{
    _portList.clear();
    _portList.append(tr(""));
    QList<QSerialPortInfo> list = QSerialPortInfo::availablePorts();
    foreach ( QSerialPortInfo info, list)
    {
        _portList.append(info.portName());
    }
    return _portList;
}

void WeatherStation::setPortName(QString value)
{
    if(_portName != value)
    {
        _portName = value;
        QSettings settings;
        settings.beginGroup("WEATHER_STATION");
        settings.setValue("PortName", _portName);
        emit portNameChanged(_portName);
    }
}

void WeatherStation::setTemperatureMax(qreal value)
{
    if(value >= -25.0 && value <= 50)
    {
        _temperatureMax = value;
        QSettings settings;
        settings.beginGroup("WEATHER_STATION");
        settings.setValue("temperatureMax", value);
        emit temperatureMaxChanged(value);
    }
}

void WeatherStation::setTemperatureMin(qreal value)
{
    if(value >= -25.0 && value <= 50)
    {
        _temperatureMin = value;
        QSettings settings;
        settings.beginGroup("WEATHER_STATION");
        settings.setValue("temperatureMin", value);
        emit temperatureMinChanged(value);
    }
}

void WeatherStation::setPrecipitationMax(qreal value)
{
    if(value >= -25.0 && value <= 50)
    {
        _precipitationMax = value;
        QSettings settings;
        settings.beginGroup("WEATHER_STATION");
        settings.setValue("precipitationMax", value);
        emit precipitationMaxChanged(value);
    }
}

void WeatherStation::setWindSpeedMax(qreal value)
{
    if(value >= -25.0 && value <= 50)
    {
        _windSpeedMax = value;
        QSettings settings;
        settings.beginGroup("WEATHER_STATION");
        settings.setValue("windSpeedMax", value);
        emit windSpeedMaxChanged(value);
    }
}
