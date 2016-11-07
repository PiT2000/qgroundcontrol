import QtQuick                  2.5
import QtQuick.Controls         1.2
import QtGraphicalEffects       1.0
import QtQuick.Controls.Styles  1.2
import QtQuick.Dialogs          1.1
import QtQuick.Layouts          1.1

import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0
import QGroundControl.FlightMap     1.0

Item {
    QGCPalette { id: qgcPal }
    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle
    //Separator
    Rectangle {
        id: sep1
        height: parent.height
        width: 2
        color: qgcPal.buttonText
        anchors.left: parent.left
        visible: !ScreenTools.isTinyScreen && _activeVehicle
    }
    Item {
        anchors.fill: parent
        QGCLabel {
            text: qsTr("test message")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            visible: !ScreenTools.isTinyScreen && _activeVehicle
        }
    }
    //Separator
    Rectangle {
        id: sep2
        height: parent.height
        width: 2
        color: qgcPal.buttonText
        anchors.right: parent.right
        visible: !ScreenTools.isTinyScreen && _activeVehicle
    }
}
