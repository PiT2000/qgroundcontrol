import QtQuick 2.4

import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.FactSystem    1.0
import QGroundControl.FlightMap     1.0
import QGroundControl.Palette       1.0

Column {
    QGCPalette {id: qgcPall}
    spacing: ScreenTools.defaultFontPixelWidth
//    anchors.margins: ScreenTools.defaultFontPixelWidth
    /*
AUX1 - chanel (-1:0:1)
AUX2 - up down
AUX3 - zoom
AUX4 - left right
*/
    QGCButton {
        id:             shot
        text:           qsTr("Snapshot")
        width:          parent.width
        onClicked: {}
    }
    Grid {
        columns: 3
        spacing: ScreenTools.defaultFontPixelWidth
        RoundButton {
            buttonImage:    "/qmlimages/ZoomMinus.svg"
            lightBorders:   true
            pressable:      true
            onPressed: {
                QGroundControl.tsuruManager.setServo(2, -1.0)
            }
            onReleased: {
                QGroundControl.tsuruManager.setServo(2, 0.0)
            }
        }
        RoundButton {
            buttonImage:    "/qmlimages/ArrowToUp.svg"
            lightBorders:   true
            pressable:      true
            onPressed: {
                QGroundControl.tsuruManager.setServo(1, 1.0)
            }
            onReleased: {
                QGroundControl.tsuruManager.setServo(1, 0.0)
            }
        }
        RoundButton {
            buttonImage:    "/qmlimages/ZoomPlus.svg"
            lightBorders:   true
            pressable:      true
            onPressed: {
                QGroundControl.tsuruManager.setServo(2, 1.0)
            }
            onReleased: {
                QGroundControl.tsuruManager.setServo(2, 0.0)
            }
        }
        RoundButton {
            buttonImage:    "/qmlimages/ArrowToLeft.svg"
            lightBorders:   true
            pressable:      true
            onPressed: {
                QGroundControl.tsuruManager.setServo(3, -1.0)
            }
            onReleased: {
                QGroundControl.tsuruManager.setServo(3, 0.0)
            }
        }

        RoundButton {
            buttonImage:    "/qmlimages/ArrowToDown.svg"
            lightBorders:   true
            pressable:      true
            onPressed: {
                QGroundControl.tsuruManager.setServo(1, -1.0)
            }
            onReleased: {
                QGroundControl.tsuruManager.setServo(1, 0.0)
            }
        }
        RoundButton {
            buttonImage:    "/qmlimages/ArrowToRight.svg"
            lightBorders:   true
            pressable:      true
            onPressed: {
                QGroundControl.tsuruManager.setServo(3, 1.0)
            }
            onReleased: {
                QGroundControl.tsuruManager.setServo(3, 0.0)
            }
        }
    }
    QGCButton {
        id:             chanel
        text:           qsTr("Change video chanel")
        width:          parent.width
        property int chanelNum: -1
        onClicked: {
            chanelNum = chanelNum+1
            if (chanelNum == 1)
            {
                chanelNum = -1
            }
            QGroundControl.tsuruManager.setServo(0, chanelNum)
        }
    }
}
