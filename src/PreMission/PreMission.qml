/****************************************************************************
 *
 *   (c) 2009-2016 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/


import QtQuick          2.4
import QtQuick.Controls 1.3
import QtQuick.Dialogs  1.2
import QtLocation       5.3
import QtPositioning    5.3
import QtQuick.Layouts  1.2

import QGroundControl               1.0
import QGroundControl.FlightMap     1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Controls      1.0
import QGroundControl.Palette       1.0
import QGroundControl.Mavlink       1.0
import QGroundControl.Controllers   1.0

/// SavePlanes

Rectangle {
    id:     preMissionView
    color:  qgcPal.window
    z:      QGroundControl.zOrderTopMost

    QGCPalette { id: qgcPal }

    Column {
        width:  parent.width
        spacing: 10
        y: 50

        QGCLabel {
            id:     title
            text:   qsTr("Select plan")
            width:  parent.width
            font.pointSize: 15
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment:Text.AlignHCenter
            wrapMode:           Text.WordWrap
        }
        Row {
            spacing:ScreenTools.defaultFontPixelHeight
            width:  parent.width
            x: 10

            QGCButton {
                text: qsTr("Mission 1")
                onClicked: loadPreMission("./missions/1.mission")
            }
            QGCButton {
                text: qsTr("Mission 2")
                onClicked: loadPreMission("./missions/2.mission")
            }
            QGCButton {
                text: qsTr("Mission 3")
                onClicked: loadPreMission("./missions/3.mission")
            }
            QGCButton {
                text: qsTr("Mission 4")
                onClicked: loadPreMission("./missions/4.mission")
            }
        }
    }
}
