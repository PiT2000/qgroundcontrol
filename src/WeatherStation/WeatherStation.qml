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
    height: QGroundControl.weatherStation.portReady ? _defaultTextHeight*6 :message.height + errorMessage.height

    QGCPalette { id: qgcPal }

    readonly property real _defaultTextHeight:  ScreenTools.defaultFontPixelHeight
    readonly property real _defaultTextWidth:   ScreenTools.defaultFontPixelWidth
    readonly property real _horizontalMargin:   _defaultTextWidth / 2
    readonly property real _verticalMargin:     _defaultTextHeight / 2
    readonly property real _buttonHeight:       ScreenTools.isTinyScreen ? ScreenTools.defaultFontPixelHeight * 3 : ScreenTools.defaultFontPixelHeight * 2
    readonly property real _buttonWidth:        ScreenTools.defaultFontPixelWidth * 10

    QGCLabel {
        id:                 message
        width:              parent.width
        anchors.top:        parent.top
        verticalAlignment:  Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        wrapMode:           Text.WordWrap
        text:               qsTr("No connect")
        visible:            !QGroundControl.weatherStation.portReady
    }
    QGCLabel {
        id:                 errorMessage
        width:              parent.width
        anchors.top:        message.bottom
        verticalAlignment:  Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        wrapMode:           Text.WordWrap
        text:               QGroundControl.weatherStation.portError
        visible:            !QGroundControl.weatherStation.portReady
    }
    GridLayout {
        id:             weatherGrid
        columns:        3
        width:          parent.width
        height:         parent.height
        visible:        QGroundControl.weatherStation.portReady

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
            text:               QGroundControl.weatherStation.temperature
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               QGroundControl.weatherStation.pressure
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               QGroundControl.weatherStation.relativeHumidity
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
            text:               QGroundControl.weatherStation.precipitation
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               QGroundControl.weatherStation.windDirection
        }
        QGCLabel {
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               QGroundControl.weatherStation.windSpeed
        }
    }
}

