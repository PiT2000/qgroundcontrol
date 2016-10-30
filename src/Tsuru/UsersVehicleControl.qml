import QtQuick                  2.5
import QtQuick.Controls         1.2
import QtGraphicalEffects       1.0
import QtQuick.Controls.Styles  1.2
import QtQuick.Dialogs          1.1

import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0

Row {
    spacing:  tbSpacing * 2
    QGCPalette { id: qgcPal }

    Item {
        id:     start
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight

        QGCColoredImage {
            id:             startIcon
            source:         "/res/Play"
            fillMode:       Image.PreserveAspectFit
            width:          mainWindow.tbCellHeight
            height:         mainWindow.tbCellHeight
            sourceSize.height: height
            color:          qgcPal.buttonText
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            anchors.fill:   parent
            onClicked: {
                startIcon.color = "#FF0000"
            }
        }
    }
    Item {
        id:     pause
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight

        QGCColoredImage {
            id:             pauseIcon
            source:         "/res/Pause"
            fillMode:       Image.PreserveAspectFit
            width:          mainWindow.tbCellHeight
            height:         mainWindow.tbCellHeight
            sourceSize.height: height
            color:          qgcPal.buttonText
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            anchors.fill:   parent
            onClicked: {
                pauseIcon.color = "#00FF00"
            }
        }
    }
    Item {
        id:     stop
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight

        QGCColoredImage {
            id:             stopIcon
            source:         "/res/Stop"
            fillMode:       Image.PreserveAspectFit
            width:          mainWindow.tbCellHeight
            height:         mainWindow.tbCellHeight
            sourceSize.height: height
            color:          qgcPal.buttonText
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            anchors.fill:   parent
            onClicked: {
                stopIcon.color = "#FF0000"
            }
        }
    }
    Item {
        id:     land
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight

        QGCColoredImage {
            id:             landIcon
            source:         "/qmlimages/LandModeCopter.svg"
            fillMode:       Image.PreserveAspectFit
            width:          mainWindow.tbCellHeight
            height:         mainWindow.tbCellHeight
            sourceSize.height: height
            color:          qgcPal.buttonText
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            anchors.fill:   parent
            onClicked: {
                landIcon.color = "#FF0000"
            }
        }
    }
}
