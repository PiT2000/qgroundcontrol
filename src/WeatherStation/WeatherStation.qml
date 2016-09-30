import QtQuick          2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts  1.1

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Controls      1.0
import QGroundControl.Palette       1.0
import QGroundControl.Controllers   1.0

Rectangle {
    id:     weatherStation
    color:  qgcPal.window
    height: QGroundControl.weatherStation.portReady ? _defaultTextHeight*8 : message.height + errorMessage.height

    QGCPalette { id: qgcPal }

    readonly property real _defaultTextHeight:  ScreenTools.defaultFontPixelHeight
    readonly property real _defaultTextWidth:   ScreenTools.defaultFontPixelWidth
    readonly property real _horizontalMargin:   _defaultTextWidth / 2
    readonly property real _verticalMargin:     _defaultTextHeight / 2
    readonly property real _buttonHeight:       ScreenTools.isTinyScreen ? ScreenTools.defaultFontPixelHeight * 3 : ScreenTools.defaultFontPixelHeight * 2
    readonly property real _buttonWidth:        ScreenTools.defaultFontPixelWidth * 10

    readonly property int _temperature:         QGroundControl.weatherStation.temperature
    readonly property int _pressure:            QGroundControl.weatherStation.pressure
    readonly property int _relativeHumidity:    QGroundControl.weatherStation.relativeHumidity
    readonly property int _precipitation:       QGroundControl.weatherStation.precipitation
    readonly property int _windDirection:       QGroundControl.weatherStation.windDirection
    readonly property int _windSpeed:           QGroundControl.weatherStation.windSpeed

    Rectangle {
        id: status
        anchors.top: parent.top
        width:  parent.width
        height: 6
        radius: 3
        color: QGroundControl.weatherStation.flightResolved ? "#00ff00" : "#ff0000"
    }

    QGCLabel {
        id:                 message
        width:              parent.width
        anchors.top:        status.bottom
        verticalAlignment:  Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        text:               qsTr("Not connected")
        visible:            !QGroundControl.weatherStation.portReady
    }
    QGCLabel {
        id:                 errorMessage
        width:              parent.width
        anchors.top:        message.bottom
        verticalAlignment:  Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        text:               QGroundControl.weatherStation.portError
        visible:            !QGroundControl.weatherStation.portReady
    }
    GridLayout {
        id:             weatherGrid
        columns:        3
        anchors.top:    status.bottom
        anchors.bottom: parent.bottom
        width:          parent.width*0.9
        visible:        QGroundControl.weatherStation.portReady
        Rectangle {
            width:  _defaultTextWidth*2
            height: _defaultTextHeight*1.5
            radius: _defaultTextWidth
            Layout.rowSpan: 2
            color: QGroundControl.weatherStation.temperatureWar ? "#00ff00" : "#ff0000"
        }
        QGCLabel {
            Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
            text:               qsTr("Temperature")
        }
        QGCLabel {
            Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
            text:               qsTr("Pressure")
        }
        QGCLabel {
            Layout.alignment:  Qt.AlignVCenter | Qt.AlignHCenter
            text:               _temperature
        }
        QGCLabel {
            Layout.alignment:  Qt.AlignVCenter | Qt.AlignHCenter
            text:               _pressure
        }
        Rectangle {
            width:  _defaultTextWidth*2
            height: _defaultTextHeight*1.5
            radius: _defaultTextWidth
            Layout.rowSpan: 2
            color: QGroundControl.weatherStation.precipitationWar ? "#00ff00" : "#ff0000"
        }
        QGCLabel {
            Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
            text:               qsTr("Precipitation")
        }
        QGCLabel {
            Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
            text:               qsTr("Humidity")
        }
        QGCLabel {
            Layout.alignment:  Qt.AlignVCenter | Qt.AlignHCenter
            text:               _precipitation
        }
        QGCLabel {
            Layout.alignment:  Qt.AlignVCenter | Qt.AlignHCenter
            text:               _relativeHumidity
        }
        Rectangle {
            width:  _defaultTextWidth*2
            height: _defaultTextHeight*1.5
            radius: _defaultTextWidth
            Layout.rowSpan: 2
            color: QGroundControl.weatherStation.windSpeedWar ? "#00ff00" : "#ff0000"
        }
        QGCLabel {
            Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
            text:               qsTr("Wind spd")
        }
        QGCLabel {
            Layout.alignment:   Qt.AlignVCenter | Qt.AlignHCenter
            text:               qsTr("Wind dir")
        }
        QGCLabel {
            Layout.alignment:  Qt.AlignVCenter | Qt.AlignHCenter
            text:               _windSpeed
        }
        QGCLabel {
            Layout.alignment:  Qt.AlignVCenter | Qt.AlignHCenter
            text:               _windDirection
        }
    }
}

