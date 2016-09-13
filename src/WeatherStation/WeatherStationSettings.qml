import QtQuick          2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts  1.1

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Controls      1.0
import QGroundControl.Palette       1.0
import QGroundControl.Controllers   1.0

Rectangle {
    id:     weatherStationSettings
    color:  qgcPal.window

    QGCPalette { id: qgcPal }

    readonly property real _defaultTextHeight:  ScreenTools.defaultFontPixelHeight
    readonly property real _defaultTextWidth:   ScreenTools.defaultFontPixelWidth
    readonly property real _horizontalMargin:   _defaultTextWidth / 2
    readonly property real _verticalMargin:     _defaultTextHeight / 2
    readonly property real _buttonHeight:       ScreenTools.isTinyScreen ? ScreenTools.defaultFontPixelHeight * 3 : ScreenTools.defaultFontPixelHeight * 2
    readonly property real _buttonWidth:        ScreenTools.defaultFontPixelWidth * 10

    readonly property var _portNameList: weat.portNameList

    WeatherStationSettingsController {
        id: weat
    }

    GridLayout {
        columns: 2
        columnSpacing: 10
        anchors.fill: parent
        QGCLabel {
            font.pointSize:     _defaultTextHeight
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
            text:               qsTr("Port: ")
        }
        ComboBox {
            width: 100
            model: weat.portNameList
        }
    }
}

