#include "WeatherStationController.h"

WeatherStationController::WeatherStationController(QObject *parent)
    : QObject(parent)
    ,_portName("")
    ,_readyRead(false)
{
    QSettings settings;
    settings.beginGroup("WEATHER_STATION");
    _portName = settings.value("PortName", "").toString();
    _bufer.clear();

    _port = new QSerialPort;
    QTimer *timer = new QTimer;
    connect( timer, SIGNAL  ( timeout()  ),
             this,  SLOT    ( openPort() ));
    openPort();
    timer->start(1000);
}

WeatherStationController::~WeatherStationController()
{

}

void WeatherStationController::openPort()
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
            setReadyRead( false );
            _port->close();
        }
        if(_port->portName() != _portName)
        {
            disconnect( _port,  SIGNAL  ( readyRead () ),
                        this,   SLOT    ( readData  () ));
            setPortError(  _portName+": "+_port->errorString() );
            setReadyRead( false );
            _port->close();
        }
    }
    else
    {//порт закрыт
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
                connect( _port, SIGNAL  (readyRead  () ),
                         this,  SLOT    (readData   () ));
                setPortError( "No error" );
                setReadyRead(true);
            }
            else
            {//порт не открылся
                setPortError( _portName+": "+_port->errorString() );
                setReadyRead(false);
            }
        }
        else
        {//нет имени
            setPortError( tr("Not selected port") );
            setReadyRead(false);
        }
    }
}

void WeatherStationController::readData()
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


