import QtQuick                  2.5
import QtQuick.Controls         1.2
import QtGraphicalEffects       1.0
import QtQuick.Controls.Styles  1.2
import QtQuick.Dialogs          1.1
import QtQuick.Layouts 1.1
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

    //View speed and alt
    Item {
        width: val.width

        height: mainWindow.tbCellHeight
        GridLayout {
            id: val
            columns: 2
//            spacing: tbSpacing * 2
            QGCLabel {
                text: qsTr("Speed")
                Layout.alignment:  Qt.AlignVCenter | Qt.AlignHCenter
            }
            QGCLabel {
                text: qsTr("Alt")
                Layout.alignment:  Qt.AlignVCenter | Qt.AlignHCenter
            }
            QGCLabel {
                text: _activeVehicle ? _activeVehicle.groundSpeed.valueString : 0.00
                Layout.alignment:  Qt.AlignVCenter | Qt.AlignHCenter
            }
            QGCLabel {
                text: _activeVehicle ? _activeVehicle.altitudeRelative.valueString : 0.00
                Layout.alignment:  Qt.AlignVCenter | Qt.AlignHCenter
            }
        }
    }

    //Mission Selector
    Item {
        width: mainWindow.tbCellHeight + missionSelectorLabel.width
        height: mainWindow.tbCellHeight
        visible: {
                    !ScreenTools.isTinyScreen
                    && _activeVehicle
                    && !_activeVehicle.armed
                    && _activeVehicle.homePositionAvailable
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
                color:          qgcPal.buttonText
                anchors.verticalCenter: parent.verticalCenter
            }
            QGCLabel {
                id:             missionSelectorLabel
                text:           qsTr("Select mission")
                font.pointSize: ScreenTools.mediumFontPointSize
                color:          qgcPal.buttonText
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(missionSelector.visible == false) {
                    missionSelectorIcon.color = qgcPal.buttonHighlight
                    missionSelectorLabel.color = qgcPal.buttonHighlight
                    missionSelector.visible = true
                }
                else {
                    missionSelectorIcon.color = qgcPal.buttonText
                    missionSelectorLabel.color = qgcPal.buttonText
                    missionSelector.visible = false
                }
            }
        }

        Rectangle {
            id:                 missionSelector
            color:              Qt.rgba(0,0,0,0.75)
            visible:            false
            anchors.left:       parent.left
            anchors.right:      parent.right
            anchors.top:        parent.bottom
            anchors.topMargin:  15
            width:              parent.width
            height:             view.height * 1.05
            ListView {
                id:             view
                clip:           true
                spacing:        ScreenTools.defaultFontPixelHeight / 2
                model:          missionListModel
                width:          parent.width * 0.95
                height:         ScreenTools.defaultFontPixelHeight * 10
                anchors.topMargin: 5
                anchors.leftMargin: 5
                delegate:QGCButton {
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
                _activeVehicle.flightMode = "Mission"
                _activeVehicle.armed = true
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
                if (_activeVehicle.flightMode == "Mission") {
                    _activeVehicle.flightMode = "Hold"
                    pauseIcon.color = qgcPal.buttonHighlight
                } else if (_activeVehicle.flightMode == "Hold") {
                    _activeVehicle.flightMode = "Mission"
                    pauseIcon.color = qgcPal.buttonText
                }
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
                _activeVehicle.flightMode = "Return"
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
                activeVehicle.flightMode = "Land"
            }
        }
    }
}//End Row
