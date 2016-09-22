import QtQuick                  2.5
import QtQuick.Controls         1.2
import QtQuick.Controls.Styles  1.2

import QGroundControl                       1.0
import QGroundControl.Controls              1.0
import QGroundControl.ScreenTools           1.0
import QGroundControl.Palette               1.0
import QGroundControl.Controllers           1.0


QGCView {
    id:                 qgcView
    viewPanel:          panel
    color:              qgcPal.window
    anchors.fill:       parent
    anchors.margins:    ScreenTools.defaultFontPixelWidth

    property real _labelWidth:                  ScreenTools.defaultFontPixelWidth * 15
    property real _editFieldWidth:              ScreenTools.defaultFontPixelWidth * 30

    WeatherStationSettingsController {
        id: weatherStationSettingsController
    }
    QGCPalette { id: qgcPal }

    QGCViewPanel {
        id:             panel
        anchors.fill:   parent
        QGCFlickable {
            clip:               true
            anchors.fill:       parent
            contentHeight:      settingsColumn.height
            contentWidth:       settingsColumn.width
            Column {
                id:                 settingsColumn
                width:              qgcView.width
                spacing:            ScreenTools.defaultFontPixelHeight * 0.5
                anchors.margins:    ScreenTools.defaultFontPixelWidth
                //-----------------------------------------------------------------
                //-- Port settings
                Item {
                    width:              qgcView.width * 0.8
                    height:             portSettingsLabel.height
                    anchors.margins:    ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    QGCLabel {
                        id:             portSettingsLabel
                        text:           qsTr("Port settings")
                        font.family:    ScreenTools.demiboldFontFamily
                    }
                }
                Rectangle {
                    height:         portSettingsCol.height + (ScreenTools.defaultFontPixelHeight * 2)
                    width:          qgcView.width * 0.8
                    color:          qgcPal.windowShade
                    anchors.margins: ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    Column {
                        id:         portSettingsCol
                        spacing:    ScreenTools.defaultFontPixelWidth
                        anchors.centerIn: parent
                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth
                            QGCLabel {
                                anchors.verticalCenter: parent.verticalCenter
                                font.family:    ScreenTools.demiboldFontFamily
                                text:           qsTr("Port name: ")
                            }
                            QGCComboBox {
                                id: portName
                                width: _labelWidth
                                model: weatherStationSettingsController.portNameList
                                Component.onCompleted: {
                                    var index = portName.find(weatherStationSettingsController.portName)
                                    if (index >= 0) {
                                        portName.currentIndex = index
                                    }
                                }
                                onActivated: {
                                    if (index != -1) {
                                        currentIndex = index
                                        weatherStationSettingsController.portName = model[index]
                                    }
                                }
                            }
                        }
                    }
                }
                //-----------------------------------------------------------------
                //-- Meteo critical
                Item {
                    width:              qgcView.width * 0.8
                    height:             temperatureRangeLabel.height
                    anchors.margins:    ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    QGCLabel {
                        id:             temperatureRangeLabel
                        text:           qsTr("Critical range")
                        font.family:    ScreenTools.demiboldFontFamily
                    }
                }
                Rectangle {
                    height:         temperatureRangeCol.height + (ScreenTools.defaultFontPixelHeight * 2)
                    width:          qgcView.width * 0.8
                    color:          qgcPal.windowShade
                    anchors.margins: ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    Column {
                        id:         temperatureRangeCol
                        spacing:    ScreenTools.defaultFontPixelWidth
                        anchors.centerIn: parent
                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth
                            QGCLabel {
                                anchors.verticalCenter: parent.verticalCenter
                                font.family:    ScreenTools.demiboldFontFamily
                                text:           qsTr("Critical temperature max: ")
                            }
                            Row {
                                spacing:    ScreenTools.defaultFontPixelWidth / 2
                                anchors.verticalCenter: parent.verticalCenter
                                QGCButton {
                                    width:  height
                                    height: temperatureRangeMaxEdit.height
                                    text:   "-"
                                    onClicked: {
                                        if(weatherStationSettingsController.temperatureMax > -25.0) {
                                            weatherStationSettingsController.temperatureMax = weatherStationSettingsController.temperatureMax - 1
                                        }
                                    }
                                }
                                QGCTextField {
                                    id:             temperatureRangeMaxEdit
                                    width:          _editFieldWidth - (height * 2) - (ScreenTools.defaultFontPixelWidth * 2)
                                    text:           weatherStationSettingsController.temperatureMax
                                    showUnits:      true
                                    unitsLabel:     "C"
                                    maximumLength:  6
                                    validator:      DoubleValidator {bottom: -25; top: 50; decimals: 0;}
                                    onEditingFinished: {
                                        var values = parseFloat(text)
                                        if(values >= -25.0 && values <= 50.0)
                                        {
                                            weatherStationSettingsController.temperatureMax = values
                                        }
                                    }
                                }
                                QGCButton {
                                    width:  height
                                    height: temperatureRangeMaxEdit.height
                                    text:   "+"
                                    onClicked: {
                                        if(weatherStationSettingsController.temperatureMax < 50.0) {
                                            weatherStationSettingsController.temperatureMax = weatherStationSettingsController.temperatureMax + 1
                                        }
                                    }
                                }
                            }
                        }
                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth
                            QGCLabel {
                                anchors.verticalCenter: parent.verticalCenter
                                font.family:    ScreenTools.demiboldFontFamily
                                text:           qsTr("Critical temperature min: ")
                            }
                            Row {
                                spacing:    ScreenTools.defaultFontPixelWidth / 2
                                anchors.verticalCenter: parent.verticalCenter
                                QGCButton {
                                    width:  height
                                    height: temperatureRangeMinEdit.height
                                    text:   "-"
                                    onClicked: {
                                        if(weatherStationSettingsController.temperatureMin > -25.0) {
                                            weatherStationSettingsController.temperatureMin = weatherStationSettingsController.temperatureMin - 1
                                        }
                                    }
                                }
                                QGCTextField {
                                    id:             temperatureRangeMinEdit
                                    width:          _editFieldWidth - (height * 2) - (ScreenTools.defaultFontPixelWidth * 2)
                                    text:           weatherStationSettingsController.temperatureMin
                                    showUnits:      true
                                    unitsLabel:     "C"
                                    maximumLength:  6
                                    validator:      DoubleValidator {bottom: -25.0; top: 50.0; decimals: 0;}
                                    onEditingFinished: {
                                        var values = parseFloat(text)
                                        if(values >= -25.0 && values <= 50.0)
                                        {
                                            weatherStationSettingsController.temperatureMin = values
                                        }
                                    }
                                }
                                QGCButton {
                                    width:  height
                                    height: temperatureRangeMinEdit.height
                                    text:   "+"
                                    onClicked: {
                                        if(weatherStationSettingsController.temperatureMin < 50.0) {
                                            weatherStationSettingsController.temperatureMin = weatherStationSettingsController.temperatureMin + 1
                                        }
                                    }
                                }
                            }
                        }
                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth
                            QGCLabel {
                                anchors.verticalCenter: parent.verticalCenter
                                font.family:    ScreenTools.demiboldFontFamily
                                text:           qsTr("Critical precipitation max: ")
                            }
                            Row {
                                spacing:    ScreenTools.defaultFontPixelWidth / 2
                                anchors.verticalCenter: parent.verticalCenter
                                QGCButton {
                                    width:  height
                                    height: precipitationRangeMaxEdit.height
                                    text:   "-"
                                    onClicked: {
                                        if(weatherStationSettingsController.precipitationMax > 0.0) {
                                            weatherStationSettingsController.precipitationMax = weatherStationSettingsController.precipitationMax - 1
                                        }
                                    }
                                }
                                QGCTextField {
                                    id:             precipitationRangeMaxEdit
                                    width:          _editFieldWidth - (height * 2) - (ScreenTools.defaultFontPixelWidth * 2)
                                    text:           weatherStationSettingsController.precipitationMax
                                    showUnits:      true
                                    unitsLabel:     "mm/s"
                                    maximumLength:  6
                                    validator:      DoubleValidator {bottom: 0.0; top: 100.0; decimals: 0;}
                                    onEditingFinished: {
                                        var values = parseFloat(text)
                                        if(values >= 0.0 && values <= 100.0)
                                        {
                                            weatherStationSettingsController.precipitationMax = values
                                        }
                                    }
                                }
                                QGCButton {
                                    width:  height
                                    height: precipitationRangeMaxEdit.height
                                    text:   "+"
                                    onClicked: {
                                        if(weatherStationSettingsController.precipitationMax < 100.0) {
                                            weatherStationSettingsController.precipitationMax = weatherStationSettingsController.precipitationMax + 1
                                        }
                                    }
                                }
                            }
                        }
                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth
                            QGCLabel {
                                anchors.verticalCenter: parent.verticalCenter
                                font.family:    ScreenTools.demiboldFontFamily
                                text:           qsTr("Critical wind speed: ")
                            }
                            Row {
                                spacing:    ScreenTools.defaultFontPixelWidth / 2
                                anchors.verticalCenter: parent.verticalCenter
                                QGCButton {
                                    width:  height
                                    height: windSpeedRangeMaxEdit.height
                                    text:   "-"
                                    onClicked: {
                                        if(weatherStationSettingsController.windSpeedMax > 0.0) {
                                            weatherStationSettingsController.windSpeedMax = weatherStationSettingsController.windSpeedMax - 1
                                        }
                                    }
                                }
                                QGCTextField {
                                    id:             windSpeedRangeMaxEdit
                                    width:          _editFieldWidth - (height * 2) - (ScreenTools.defaultFontPixelWidth * 2)
                                    text:           weatherStationSettingsController.windSpeedMax
                                    showUnits:      true
                                    unitsLabel:     "m/s"
                                    maximumLength:  6
                                    validator:      DoubleValidator {bottom: 0.0; top: 50.0; decimals: 0;}
                                    onEditingFinished: {
                                        var values = parseFloat(text)
                                        if(values >= 0.0 && values <= 50.0)
                                        {
                                            weatherStationSettingsController.windSpeedMax = values
                                        }
                                    }
                                }
                                QGCButton {
                                    width:  height
                                    height: windSpeedRangeMaxEdit.height
                                    text:   "+"
                                    onClicked: {
                                        if(weatherStationSettingsController.windSpeedMax < 50.0) {
                                            weatherStationSettingsController.windSpeedMax = weatherStationSettingsController.windSpeedMax + 1
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }//-- End Column
        }
    }
}
