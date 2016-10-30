import QtQuick                  2.5
import QtQuick.Controls         1.2
import QtGraphicalEffects       1.0
import QtQuick.Controls.Styles  1.2
import QtQuick.Dialogs          1.1
import Qt.labs.folderlistmodel  2.1

import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0

Row {
    spacing:  tbSpacing * 2
    QGCPalette { id: qgcPal }
    FolderListModel {
        id:             missionListModel
        showDirs:       false
        nameFilters:    "*.mission"
        folder:         "file:"+QGroundControl.tsuruManager.missionPath
    }

    property var _activeVehicle: QGroundControl.multiVehicleManager.activeVehicle

    //Mission Selector
    Item {
        width: mainWindow.tbCellHeight + missionSelectorLabel.width
        height: mainWindow.tbCellHeight
        visible: {
                    !ScreenTools.isTinyScreen
                    && _activeVehicle
                    && !_activeVehicle.armed
                    && _activeVehicle.flightMode != "Land"
        }
        Row {
            QGCColoredImage {
                id:             missionSelectorIcon
                source:         "/qmlimages/MapSync.svg"
                fillMode:       Image.PreserveAspectFit
                width:          mainWindow.tbCellHeight
                height:         mainWindow.tbCellHeight
                sourceSize.height: height
                color:          "#00FF00"
                anchors.verticalCenter: parent.verticalCenter
            }
            QGCLabel {
                id:             missionSelectorLabel
                text:           qsTr("Select mission")
                font.pointSize: ScreenTools.mediumFontPointSize
                color:          "#00FF00"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(missionSelector.visible == false) {
                    missionSelectorIcon.color = "#FF0000"
                    missionSelectorLabel.color = "#FF0000"
                    missionSelector.visible = true
                }
                else {
                    missionSelectorIcon.color = "#00FF00"
                    missionSelectorLabel.color = "#00FF00"
                    missionSelector.visible = false
                }
            }
        }

        Rectangle {
            id:             missionSelector
            color:          qgcPal.window
            visible:        false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:    parent.bottom
            width:          parent.width
            height:         view.height * 1.05
            ListView {
                id:             view
                clip:           true
                spacing:        ScreenTools.defaultFontPixelHeight / 2
                model:          missionListModel
                width:          parent.width * 0.95
                height:         ScreenTools.defaultFontPixelHeight * 10
                delegate: QGCButton {
                    width:      parent.width
                    height:     ScreenTools.defaultFontPixelHeight * 1.5
                    text:       model.fileBaseName
                    onClicked:  {
                        loadPreMission(model.filePath)
                    }
                }
            }
        }
    }

    //Control panel
    Item {
        id:     start
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight
        visible: {
                    !ScreenTools.isTinyScreen
                    && _activeVehicle
                    && !_activeVehicle.armed
                    && _activeVehicle.homePositionAvailable
//                        && _activeVehicle.flightMode != "Return"
                    && _activeVehicle.flightMode != "Land"
        }
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
        visible: {
                    !ScreenTools.isTinyScreen
                    && _activeVehicle
                    && _activeVehicle.armed
                    && _activeVehicle.flightMode != "Return"
                    && _activeVehicle.flightMode != "Land"
        }

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
        visible: {
                    !ScreenTools.isTinyScreen
                    && _activeVehicle
                    && _activeVehicle.armed
                    && _activeVehicle.flightMode != "Return"
                    && _activeVehicle.flightMode != "Land"
        }

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
        visible: {
                    !ScreenTools.isTinyScreen
                    && _activeVehicle
                    && _activeVehicle.armed
                    && _activeVehicle.flightMode != "Land"
        }

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
}//End Row
