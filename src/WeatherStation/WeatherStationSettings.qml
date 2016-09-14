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

    readonly property var _portNameList: weatherStationSettingsController.portNameList

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
                                model: _portNameList
                                currentIndex: 0
                                Component.onCompleted: {}
                                onActivated: {}
                            }
                        }
                    }
                }
                //-----------------------------------------------------------------
                //-- Temperature range
                Item {
                    width:              qgcView.width * 0.8
                    height:             temperatureRangeLabel.height
                    anchors.margins:    ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    QGCLabel {
                        id:             temperatureRangeLabel
                        text:           qsTr("Temperature range")
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
                                text:           qsTr("Temperature max: ")
                            }
                            Row {
                                spacing:    ScreenTools.defaultFontPixelWidth / 2
                                anchors.verticalCenter: parent.verticalCenter
                                QGCButton {
                                    width:  height
                                    height: temperatureRangeMaxEdit.height
                                    text:   "-"
                                    onClicked: {}
                                }
                                QGCTextField {
                                    id:             temperatureRangeMaxEdit
                                    width:          _editFieldWidth - (height * 2) - (ScreenTools.defaultFontPixelWidth * 2)
                                    text:           QGroundControl.baseFontPointSize
                                    showUnits:      true
                                    unitsLabel:     "C"
                                    maximumLength:  6
                                    validator:      DoubleValidator {bottom: 6.0; top: 48.0; decimals: 2;}
                                    onEditingFinished: {}
                                }
                                QGCButton {
                                    width:  height
                                    height: temperatureRangeMaxEdit.height
                                    text:   "+"
                                    onClicked: {}
                                }
                            }
                        }
                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth
                            QGCLabel {
                                anchors.verticalCenter: parent.verticalCenter
                                font.family:    ScreenTools.demiboldFontFamily
                                text:           qsTr("Temperature min: ")
                            }
                            Row {
                                spacing:    ScreenTools.defaultFontPixelWidth / 2
                                anchors.verticalCenter: parent.verticalCenter
                                QGCButton {
                                    width:  height
                                    height: temperatureRangeMinEdit.height
                                    text:   "-"
                                    onClicked: {}
                                }
                                QGCTextField {
                                    id:             temperatureRangeMinEdit
                                    width:          _editFieldWidth - (height * 2) - (ScreenTools.defaultFontPixelWidth * 2)
                                    text:           QGroundControl.baseFontPointSize
                                    showUnits:      true
                                    unitsLabel:     "C"
                                    maximumLength:  6
                                    validator:      DoubleValidator {bottom: 6.0; top: 48.0; decimals: 2;}
                                    onEditingFinished: {}
                                }
                                QGCButton {
                                    width:  height
                                    height: temperatureRangeMinEdit.height
                                    text:   "+"
                                    onClicked: {}
                                }
                            }
                        }
                    }
                }
                //-----------------------------------------------------------------
                //-- Pressure range
                Item {
                    width:              qgcView.width * 0.8
                    height:             pressureRangeLabel.height
                    anchors.margins:    ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    QGCLabel {
                        id:             pressureRangeLabel
                        text:           qsTr("Pressure range")
                        font.family:    ScreenTools.demiboldFontFamily
                    }
                }
                Rectangle {
                    height:         pressureRangeCol.height + (ScreenTools.defaultFontPixelHeight * 2)
                    width:          qgcView.width * 0.8
                    color:          qgcPal.windowShade
                    anchors.margins: ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    Column {
                        id:         pressureRangeCol
                        spacing:    ScreenTools.defaultFontPixelWidth
                        anchors.centerIn: parent
                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth
                            QGCLabel {
                                anchors.verticalCenter: parent.verticalCenter
                                font.family:    ScreenTools.demiboldFontFamily
                                text:           qsTr("Pressure min: ")
                            }
                            Row {
                                spacing:    ScreenTools.defaultFontPixelWidth / 2
                                anchors.verticalCenter: parent.verticalCenter
                                QGCButton {
                                    width:  height
                                    height: pressureRangeMaxEdit.height
                                    text:   "-"
                                    onClicked: {}
                                }
                                QGCTextField {
                                    id:             pressureRangeMaxEdit
                                    width:          _editFieldWidth - (height * 2) - (ScreenTools.defaultFontPixelWidth * 2)
                                    text:           QGroundControl.baseFontPointSize
                                    showUnits:      true
                                    unitsLabel:     "mbar"
                                    maximumLength:  6
                                    validator:      DoubleValidator {bottom: 6.0; top: 48.0; decimals: 2;}
                                    onEditingFinished: {}
                                }
                                QGCButton {
                                    width:  height
                                    height: pressureRangeMaxEdit.height
                                    text:   "+"
                                    onClicked: {}
                                }
                            }
                        }
                    }
                }
                //-----------------------------------------------------------------
                //-- Humidity range
                Item {
                    width:              qgcView.width * 0.8
                    height:             humidityRangeLabel.height
                    anchors.margins:    ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    QGCLabel {
                        id:             humidityRangeLabel
                        text:           qsTr("Humidity range")
                        font.family:    ScreenTools.demiboldFontFamily
                    }
                }
                Rectangle {
                    height:         humidityRangeCol.height + (ScreenTools.defaultFontPixelHeight * 2)
                    width:          qgcView.width * 0.8
                    color:          qgcPal.windowShade
                    anchors.margins: ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    Column {
                        id:         humidityRangeCol
                        spacing:    ScreenTools.defaultFontPixelWidth
                        anchors.centerIn: parent
                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth
                            QGCLabel {
                                anchors.verticalCenter: parent.verticalCenter
                                font.family:    ScreenTools.demiboldFontFamily
                                text:           qsTr("Humidity max: ")
                            }
                            Row {
                                spacing:    ScreenTools.defaultFontPixelWidth / 2
                                anchors.verticalCenter: parent.verticalCenter
                                QGCButton {
                                    width:  height
                                    height: humidityRangeMaxEdit.height
                                    text:   "-"
                                    onClicked: {}
                                }
                                QGCTextField {
                                    id:             humidityRangeMaxEdit
                                    width:          _editFieldWidth - (height * 2) - (ScreenTools.defaultFontPixelWidth * 2)
                                    text:           QGroundControl.baseFontPointSize
                                    showUnits:      true
                                    unitsLabel:     "%"
                                    maximumLength:  6
                                    validator:      DoubleValidator {bottom: 6.0; top: 48.0; decimals: 2;}
                                    onEditingFinished: {}
                                }
                                QGCButton {
                                    width:  height
                                    height: humidityRangeMaxEdit.height
                                    text:   "+"
                                    onClicked: {}
                                }
                            }
                        }
                    }
                }
                //-----------------------------------------------------------------
                //-- Precipitation range
                Item {
                    width:              qgcView.width * 0.8
                    height:             precipitationRangeLabel.height
                    anchors.margins:    ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    QGCLabel {
                        id:             precipitationRangeLabel
                        text:           qsTr("Precipitation range")
                        font.family:    ScreenTools.demiboldFontFamily
                    }
                }
                Rectangle {
                    height:         precipitationRangeCol.height + (ScreenTools.defaultFontPixelHeight * 2)
                    width:          qgcView.width * 0.8
                    color:          qgcPal.windowShade
                    anchors.margins: ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    Column {
                        id:         precipitationRangeCol
                        spacing:    ScreenTools.defaultFontPixelWidth
                        anchors.centerIn: parent
                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth
                            QGCLabel {
                                anchors.verticalCenter: parent.verticalCenter
                                font.family:    ScreenTools.demiboldFontFamily
                                text:           qsTr("Precipitation max: ")
                            }
                            Row {
                                spacing:    ScreenTools.defaultFontPixelWidth / 2
                                anchors.verticalCenter: parent.verticalCenter
                                QGCButton {
                                    width:  height
                                    height: precipitationRangeMaxEdit.height
                                    text:   "-"
                                    onClicked: {}
                                }
                                QGCTextField {
                                    id:             precipitationRangeMaxEdit
                                    width:          _editFieldWidth - (height * 2) - (ScreenTools.defaultFontPixelWidth * 2)
                                    text:           QGroundControl.baseFontPointSize
                                    showUnits:      true
                                    unitsLabel:     "mm/s"
                                    maximumLength:  6
                                    validator:      DoubleValidator {bottom: 6.0; top: 48.0; decimals: 2;}
                                    onEditingFinished: {}
                                }
                                QGCButton {
                                    width:  height
                                    height: precipitationRangeMaxEdit.height
                                    text:   "+"
                                    onClicked: {}
                                }
                            }
                        }
                    }
                }
                //-----------------------------------------------------------------
                //-- Wind Speed range
                Item {
                    width:              qgcView.width * 0.8
                    height:             windSpeedRangeLabel.height
                    anchors.margins:    ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    QGCLabel {
                        id:             windSpeedRangeLabel
                        text:           qsTr("Wind speed range")
                        font.family:    ScreenTools.demiboldFontFamily
                    }
                }
                Rectangle {
                    height:         windSpeedRangeCol.height + (ScreenTools.defaultFontPixelHeight * 2)
                    width:          qgcView.width * 0.8
                    color:          qgcPal.windowShade
                    anchors.margins: ScreenTools.defaultFontPixelWidth
                    anchors.horizontalCenter: parent.horizontalCenter
                    Column {
                        id:         windSpeedRangeCol
                        spacing:    ScreenTools.defaultFontPixelWidth
                        anchors.centerIn: parent
                        Row {
                            spacing: ScreenTools.defaultFontPixelWidth
                            QGCLabel {
                                anchors.verticalCenter: parent.verticalCenter
                                font.family:    ScreenTools.demiboldFontFamily
                                text:           qsTr("Wind speed: ")
                            }
                            Row {
                                spacing:    ScreenTools.defaultFontPixelWidth / 2
                                anchors.verticalCenter: parent.verticalCenter
                                QGCButton {
                                    width:  height
                                    height: windSpeedRangeMaxEdit.height
                                    text:   "-"
                                    onClicked: {}
                                }
                                QGCTextField {
                                    id:             windSpeedRangeMaxEdit
                                    width:          _editFieldWidth - (height * 2) - (ScreenTools.defaultFontPixelWidth * 2)
                                    text:           QGroundControl.baseFontPointSize
                                    showUnits:      true
                                    unitsLabel:     "m/s"
                                    maximumLength:  6
                                    validator:      DoubleValidator {bottom: 6.0; top: 48.0; decimals: 2;}
                                    onEditingFinished: {}
                                }
                                QGCButton {
                                    width:  height
                                    height: windSpeedRangeMaxEdit.height
                                    text:   "+"
                                    onClicked: {}
                                }
                            }
                        }
                    }
                }
            }//-- End Column
        }
    }
}

