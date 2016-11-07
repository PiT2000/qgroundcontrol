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
import QGroundControl.FlightMap     1.0

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

    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            if(_activeVehicle) {
                if(_activeVehicle.armed) {
                    missionSelector.visible = false
                    missionSelectorIcon.color = qgcPal.buttonText
                    missionSelectorLabel.color = qgcPal.buttonText
                }
                else {
                    cameraPopup.visible = false
                    cameraIcon.color = qgcPal.buttonText
                    pauseIcon.color = qgcPal.buttonText
                }
            }
        }

    }

    //Indicator button
    Item {
        id:     indicator
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight
        visible: !ScreenTools.isTinyScreen && _activeVehicle
        QGCColoredImage {
            id:             indicatorIcon
            source:         "/qmlimages/Hamburger.svg"
            fillMode:       Image.PreserveAspectFit
            width:          mainWindow.tbCellHeight
            height:         mainWindow.tbCellHeight
            sourceSize.height: height
            color:          qgcPal.buttonText
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(indicatorPopup.visible == false) {
                    indicatorIcon.color = qgcPal.buttonHighlight
                    indicatorPopup.visible = true
                }
                else {
                    indicatorIcon.color = qgcPal.buttonText
                    indicatorPopup.visible = false
                }
            }
        }
        Rectangle {
            id:                 indicatorPopup
            color:              Qt.rgba(0,0,0,0.75)
            visible:            false
            anchors.left:       parent.left
            anchors.top:        parent.bottom
            anchors.leftMargin: -10
            anchors.topMargin:  cameraPopup.visible == false ? 15 : cameraPopup.height + 25
            width:              200
            height:             _valuesWidget.height+10
            Item {
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                InstrumentSwipeView {
                    id:                 _valuesWidget
                    width:              parent.width
                    textColor:          qgcPal.text
                    backgroundColor:    Qt.rgba(0,0,0,0.75)
                    maxHeight:          300
                }
            }
        }
    }
    //Camera button
    Item {
        id:     camera
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight
        visible: !ScreenTools.isTinyScreen && _activeVehicle
        QGCColoredImage {
            id:             cameraIcon
            source:         "/qmlimages/CameraComponentIcon.png"
            fillMode:       Image.PreserveAspectFit
            width:          mainWindow.tbCellHeight
            height:         mainWindow.tbCellHeight
            sourceSize.height: height
            color:          qgcPal.buttonText
            opacity:        _activeVehicle && _activeVehicle.armed ? 1 : 0.5
            anchors.verticalCenter: parent.verticalCenter
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(cameraIcon.opacity == 1) {
                    if(cameraPopup.visible == false) {
                        cameraIcon.color = qgcPal.buttonHighlight
                        cameraPopup.visible = true
                    }
                    else {
                        cameraIcon.color = qgcPal.buttonText
                        cameraPopup.visible = false
                    }
                }
            }
        }
        Rectangle {
            id:                 cameraPopup
            color:              Qt.rgba(0,0,0,0.75)
            visible:            false
            anchors.left:       parent.left
            anchors.top:        parent.bottom
            anchors.leftMargin: 4-mainWindow.tbCellHeight*2
            anchors.topMargin:  15
            width:              200
            height:             cameraControls.height+10
            Item {
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                CameraControls {
                    id: cameraControls
                    width: parent.width
                }
            }
        }
    }
    //Separator
    Rectangle {
        height: parent.height
        width: 2
        color: qgcPal.buttonText
        visible: {
            !ScreenTools.isTinyScreen
                    && _activeVehicle
        }
    }
    //Mission Selector
    Item {
        width: mainWindow.tbCellHeight + missionSelectorLabel.width
        height: mainWindow.tbCellHeight
        visible: {
            !ScreenTools.isTinyScreen
                    && _activeVehicle
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
                opacity: {  _activeVehicle
                            && !_activeVehicle.armed
                            && _activeVehicle.homePositionAvailable
                            && _activeVehicle.flightMode != "Land"
                            ? 1 : 0.5
                }
            }
            QGCLabel {
                id:             missionSelectorLabel
                text:           qsTr("Select mission")
                font.pointSize: ScreenTools.mediumFontPointSize
                color:          qgcPal.buttonText
                anchors.verticalCenter: parent.verticalCenter
                opacity: {  _activeVehicle
                            && !_activeVehicle.armed
                            && _activeVehicle.homePositionAvailable
                            && _activeVehicle.flightMode != "Land"
                            ? 1 : 0.5
                }
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(missionSelectorIcon.opacity == 1) {
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
        }

        Rectangle {
            id:                 missionSelector
            color:              Qt.rgba(0,0,0,0.75)
            visible:            false
            anchors.left:       parent.left
            anchors.top:        parent.bottom
            anchors.topMargin:  5
            anchors.leftMargin: -20
            width:              parent.width + 40
            height:             view.height * 1.05
            Item {
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                ListView {
                    id:             view
                    clip:           true
                    spacing:        ScreenTools.defaultFontPixelHeight / 2
                    model:          missionListModel
                    width:          parent.width
                    height:         { missionListModel.count <= 10
                                      ? ScreenTools.defaultFontPixelHeight * 1.5 * missionListModel.count
                                      : ScreenTools.defaultFontPixelHeight * 1.5 * 12
                                    }
                    anchors.topMargin: 5
                    anchors.leftMargin: 5
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
    }
    //Separator
    Rectangle {
        height: parent.height
        width: 2
        color: qgcPal.buttonText
        visible: {
            !ScreenTools.isTinyScreen
                    && _activeVehicle
        }
    }
    //Control panel
    //Start button
    Item {
        id:     start
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight
        visible: {
            !ScreenTools.isTinyScreen
                    && _activeVehicle
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
            opacity: {  _activeVehicle
                        && !_activeVehicle.armed
                        && _activeVehicle.homePositionAvailable
                        && _activeVehicle.flightMode != "Land"
                        ? 1 : 0.5
            }
        }
        MouseArea {
            anchors.fill:   parent
            onClicked: {
                if(startIcon.opacity == 1) {
                    _activeVehicle.flightMode = "Mission"
                    _activeVehicle.armed = true
                }
            }
        }
    }
    //Pause button
    Item {
        id:     pause
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight
        visible: {
            !ScreenTools.isTinyScreen
                    && _activeVehicle
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
            opacity: {  _activeVehicle
                        && _activeVehicle.armed
                        && _activeVehicle.flightMode != "Return"
                        && _activeVehicle.flightMode != "Land"
                        ? 1 : 0.5
            }
        }
        MouseArea {
            anchors.fill:   parent
            onClicked: {
                if(pauseIcon.opacity == 1) {
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
    }
    //Stop button (Return to home)
    Item {
        id:     stop
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight
        visible: {
            !ScreenTools.isTinyScreen
                    && _activeVehicle
        }

        QGCColoredImage {
            id:             stopIcon
            source:         "/res/Stop"
            fillMode:       Image.PreserveAspectFit
            width:          mainWindow.tbCellHeight
            height:         mainWindow.tbCellHeight*2
            sourceSize.height: height
            color:          qgcPal.buttonText
            anchors.verticalCenter: parent.verticalCenter
            opacity: {  _activeVehicle
                        && _activeVehicle.armed
                        && _activeVehicle.flightMode != "Return"
                        && _activeVehicle.flightMode != "Land"
                        ? 1 : 0.5
            }
        }
        MouseArea {
            anchors.fill:   parent
            onClicked: {
                if(stopIcon.opacity == 1) {
                    _activeVehicle.flightMode = "Return"
                    pauseIcon.color = qgcPal.buttonText
                }
            }
        }
    }
    //Separator
    Rectangle {
        height: parent.height
        width: 2
        color: qgcPal.buttonText
        visible: {
            !ScreenTools.isTinyScreen
                    && _activeVehicle
        }
    }
    //Land button
    Item {
        id:     land
        width:  mainWindow.tbCellHeight
        height: mainWindow.tbCellHeight
        visible: {
            !ScreenTools.isTinyScreen
                    && _activeVehicle
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
            opacity: {  _activeVehicle
                        && _activeVehicle.armed
                        && _activeVehicle.flightMode != "Land"
                        ? 1 : 0.5
            }
        }
        MouseArea {
            anchors.fill:   parent
            onClicked: {
                if(landIcon.opacity == 1) {
                    activeVehicle.flightMode = "Land"
                    pauseIcon.color = qgcPal.buttonText
                }
            }
        }
    }
    //Separator
    Rectangle {
        height: parent.height
        width: 2
        color: qgcPal.buttonText
        visible: {
            !ScreenTools.isTinyScreen
                    && _activeVehicle
        }
    }
}//End Row
