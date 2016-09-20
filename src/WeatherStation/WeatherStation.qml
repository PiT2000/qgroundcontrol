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

    QGCPalette { id: qgcPal }
    WeatherStationController {
        id: weatherStationController
    }

    readonly property real _defaultTextHeight:  ScreenTools.defaultFontPixelHeight
    readonly property real _defaultTextWidth:   ScreenTools.defaultFontPixelWidth
    readonly property real _fontSize:           ScreenTools.mediumFontPointSize
    readonly property real _horizontalMargin:   _defaultTextWidth / 2
    readonly property real _verticalMargin:     _defaultTextHeight / 2
    readonly property real _buttonHeight:       ScreenTools.isTinyScreen ? ScreenTools.defaultFontPixelHeight * 3 : ScreenTools.defaultFontPixelHeight * 2
    readonly property real _buttonWidth:        ScreenTools.defaultFontPixelWidth * 10

    readonly property real _temperature:        weatherStationController.temperature
    readonly property real _pressure:           weatherStationController.pressure
    readonly property real _relativeHumidity:   weatherStationController.relativeHumidity
    readonly property real _precipitation:      weatherStationController.precipitation
    readonly property real _windDirection:      weatherStationController.windDirection
    readonly property real _windSpeed:          weatherStationController.windSpeed


    QGCLabel {
        id:                 message
        width:              parent.width
        anchors.top:        parent.top
        verticalAlignment:  Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        wrapMode:           Text.WordWrap
        text:               qsTr("No connect")
        visible: !weatherStationController.readyRead
    }
    QGCLabel {
        id:                 errorMaage
        width:              parent.width
        anchors.top:        message.bottom
        verticalAlignment:  Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        wrapMode:           Text.WordWrap
        text:               weatherStationController.portError
        visible: !weatherStationController.readyRead
    }
    GridLayout {
        columns:        3
        width:          parent.width
        height:         parent.height
        visible:        weatherStationController.readyRead

        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Temp")
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Pres")
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Rh")
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               _temperature
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               _pressure
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               _relativeHumidity
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Prec")
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Wind")
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Wind spd")
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               _precipitation
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               _windDirection
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               _windSpeed
        }
    }
}

