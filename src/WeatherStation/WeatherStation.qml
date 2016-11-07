import QtQuick          2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts  1.1

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Controls      1.0
import QGroundControl.Palette       1.0
import QGroundControl.Controllers   1.0

Row {
    readonly property var _weatherStation: QGroundControl.weatherStation

    readonly property int _temperature:         _weatherStation.temperature
    readonly property int _pressure:            _weatherStation.pressure
    readonly property int _relativeHumidity:    _weatherStation.relativeHumidity
    readonly property int _precipitation:       _weatherStation.precipitation
    readonly property int _windDirection:       _weatherStation.windDirection
    readonly property int _windSpeed:           _weatherStation.windSpeed

    readonly property var _colorTemperature:    _weatherStation.temperatureWar    ? "#00FF00" : "#FF0000"
    readonly property var _colorPrecipitation:  _weatherStation.precipitationWar  ? "#00FF00" : "#FF0000"
    readonly property var _colorWindSpeed:      _weatherStation.windSpeedWar      ? "#00FF00" : "#FF0000"

    QGCPalette { id: qgcPal }

    Item {
        width:                      mainWindow.tbCellHeight
        height:                     mainWindow.tbCellHeight
        QGCColoredImage {
            id:                     weatherStationIcon
            source:                 "/qmlimages/Weather.svg"
            fillMode:               Image.PreserveAspectFit
            width:                  mainWindow.tbCellHeight
            height:                 mainWindow.tbCellHeight
            sourceSize.height:      height
            color:                  _weatherStation.flightResolved ? "#00ff00" : "#ff0000"
            anchors.verticalCenter: parent.verticalCenter
        }
        Rectangle {
            id:                     weatherStationPopUp
            color:                  Qt.rgba(0,0,0,0.75)
            visible:                false
            anchors.right:          parent.right
            anchors.top:            parent.bottom
            anchors.rightMargin:    -25
            anchors.topMargin:      15
            width:                  _weatherStation.portReady ? mainWindow.tbCellHeight * 6 : message.width+30
            height:                 _weatherStation.portReady ? weatherGrid.height+20 : message.height+10
            Item {
                anchors.fill: parent
                //                anchors.leftMargin: 5
                //                anchors.rightMargin: 5
                //                anchors.topMargin: 5
                //                anchors.bottomMargin: 5
                QGCLabel {
                    id:                 message
                    color:              "#FF0000"
                    font.pointSize:     ScreenTools.largeFontPointSize
                    text:               qsTr("Not connected\n") + _weatherStation.portError
                    verticalAlignment:  Text.AlignVCenter
                    horizontalAlignment:Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    visible:            !_weatherStation.portReady
                }
            }
            Item {
                anchors.fill: parent
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                anchors.topMargin: 10
                anchors.bottomMargin: 10

                GridLayout {
                    id:                 weatherGrid
                    width:              parent.width*0.9
                    visible:            _weatherStation.portReady
                    columns:            2
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter// | Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               qsTr("Temperature")
                        color:              _colorTemperature
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               _temperature
                        color:              _colorTemperature
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter// | Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               qsTr("Pressure")
                        color:              "#00FF00"
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               _pressure
                        color:              "#00FF00"
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter// | Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               qsTr("Precipitation")
                        color:              _colorPrecipitation
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               _precipitation
                        color:              _colorPrecipitation
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter// | Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               qsTr("Humidity")
                        color:              "#00FF00"
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               _relativeHumidity
                        color:              "#00FF00"
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter //| Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               qsTr("Wind spd")
                        color:              _colorWindSpeed
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               _windSpeed
                        color:              _colorWindSpeed
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter //| Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               qsTr("Wind dir")
                        color:              "#00FF00"
                    }
                    QGCLabel {
                        Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
                        font.pointSize:     ScreenTools.largeFontPointSize
                        text:               _windDirection
                        color:              "#00FF00"
                    }
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(weatherStationPopUp.visible == false) {
                    weatherStationPopUp.visible = true
                }
                else {
                    weatherStationPopUp.visible = false
                }
            }
        }
    }
    Item {
        width:                      mainWindow.tbCellHeight
        height:                     mainWindow.tbCellHeight
        Image {
            source:                 "/qmlimages/Yield.svg"
            fillMode:               Image.PreserveAspectFit
            width:                  mainWindow.tbCellHeight/2
            height:                 mainWindow.tbCellHeight/2
            sourceSize.height:      height
            anchors.verticalCenter: parent.verticalCenter
            visible:                !_weatherStation.portReady
        }
    }
}
