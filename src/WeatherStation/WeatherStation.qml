import QtQuick          2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Controls      1.0
import QGroundControl.Palette       1.0
import QGroundControl.Controllers   1.0

Rectangle {
    id:     weatherStation
    color:  qgcPal.window

    QGCPalette { id: qgcPal }

    readonly property real _defaultTextHeight:  ScreenTools.defaultFontPixelHeight
    readonly property real _defaultTextWidth:   ScreenTools.defaultFontPixelWidth
    readonly property real _fontSize:           ScreenTools.mediumFontPointSize
    readonly property real _horizontalMargin:   _defaultTextWidth / 2
    readonly property real _verticalMargin:     _defaultTextHeight / 2
    readonly property real _buttonHeight:       ScreenTools.isTinyScreen ? ScreenTools.defaultFontPixelHeight * 3 : ScreenTools.defaultFontPixelHeight * 2
    readonly property real _buttonWidth:        ScreenTools.defaultFontPixelWidth * 10
    QGCLabel {
        id:                 title
        anchors.top:        parent.top
        anchors.left:       parent.left
        anchors.right:      parent.right
        font.pointSize:     _fontSize
        verticalAlignment:  Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        wrapMode:           Text.WordWrap
        text:               qsTr("Weather station")
    }
    GridLayout {
        columns: 3
        width: parent.width
        anchors.top: title.bottom

        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Temp")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Pres")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Rh")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("00")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("00")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("00")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Prec")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Wind")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Wind spd")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("False")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("00")
        }
        QGCLabel {
            font.pointSize:     _fontSize
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("00")
        }
    }
}

