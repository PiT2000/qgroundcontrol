import QtQuick          2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts  1.2
import Qt.labs.folderlistmodel 2.1

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Controls      1.0
import QGroundControl.Palette       1.0
import QGroundControl.Controllers   1.0

/// SavePlanes

Rectangle {
    id:     preMissionView
    color:  qgcPal.window
    z:      QGroundControl.zOrderTopMost

    readonly property real _defaultTextHeight:  ScreenTools.defaultFontPixelHeight
    readonly property real _defaultTextWidth:   ScreenTools.defaultFontPixelWidth
    readonly property real _horizontalMargin:   _defaultTextWidth / 2
    readonly property real _verticalMargin:     _defaultTextHeight / 2
    readonly property real _buttonHeight:       ScreenTools.isTinyScreen ? ScreenTools.defaultFontPixelHeight * 3 : ScreenTools.defaultFontPixelHeight * 2
    readonly property real _buttonWidth:        ScreenTools.defaultFontPixelWidth * 10

    property var    _fileList:          preMissionController.fileList
    property string _preMissionPath:    preMissionController.preMissionPath

    QGCPalette { id: qgcPal }

    PreMissionController {
        id: preMissionController
    }

    FolderListModel {
        id:             preMissionModel
        showDirs:       false
        nameFilters:    "*.mission"
        folder:         "file:/"+_preMissionPath
    }

    QGCLabel {
        id:                 title
        anchors.top:        parent.top
        anchors.left:       parent.left
        anchors.right:      parent.right
        anchors.margins:    _horizontalMargin
        height:             _buttonHeight*2
        font.pointSize:     _defaultTextHeight
        verticalAlignment:  Text.AlignVCenter
        horizontalAlignment:Text.AlignHCenter
        wrapMode:           Text.WordWrap

        text:               "Please select mission"
    }
    GridView {
        id: view
        anchors.top:        title.bottom
        anchors.bottom:     parent.bottom
        anchors.left:       parent.left
        anchors.right:      parent.right
        anchors.margins:    _horizontalMargin
        cellHeight:         _buttonHeight*2
        cellWidth:          _buttonWidth*5
        clip:               true
        model:              preMissionModel

        delegate: Item {
            height:         view.cellHeight
            width:          view.cellWidth
            QGCButton {
                anchors.fill:       parent
                anchors.margins:    _horizontalMargin
                text:               model.fileName
                onClicked:          loadPreMission(_preMissionPath+model.fileName)
            }//End QGCButton
        }//End Item
    }//End View
}//End main Rectangle





