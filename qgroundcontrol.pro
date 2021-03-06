# -------------------------------------------------
# QGroundControl - Micro Air Vehicle Groundstation
# Please see our website at <http://qgroundcontrol.org>
# Maintainer:
# Lorenz Meier <lm@inf.ethz.ch>
# (c) 2009-2015 QGroundControl Developers
# License terms set in COPYING.md
# -------------------------------------------------

exists($${OUT_PWD}/qgroundcontrol.pro) {
    error("You must use shadow build (e.g. mkdir build; cd build; qmake ../qgroundcontrol.pro).")
}

message(Qt version $$[QT_VERSION])

!equals(QT_MAJOR_VERSION, 5) | !greaterThan(QT_MINOR_VERSION, 4) {
    error("Unsupported Qt version, 5.5+ is required")
}

include(QGCCommon.pri)

TARGET   = QGroundControl
TEMPLATE = app

#Translation QGC
TRANSLATIONS += translations/qgc_ru.ts

lupdate_only{
    SOURCES += CodingStyle.qml \
            += src/ui/AppSettings.qml \
            += src/ui/MainWindowNative.qml \
            += src/ui/MainWindowHybrid.qml \
            += src/ui/toolbar/MainToolBar.qml \
            += src/ui/toolbar/MainToolBarIndicators.qml \
            += src/ui/toolbar/GPS.qml \
            += src/ui/toolbar/SignalStrength.qml \
            += src/ui/preferences/MockLinkSettings.qml \
            += src/ui/preferences/LogReplaySettings.qml \
            += src/ui/preferences/UdpSettings.qml \
            += src/ui/preferences/BluetoothSettings.qml \
            += src/ui/preferences/SerialSettings.qml \
            += src/ui/preferences/TcpSettings.qml \
            += src/ui/preferences/MockLink.qml \
            += src/ui/preferences/LinkSettings.qml \
            += src/ui/preferences/MavlinkSettings.qml \
            += src/ui/preferences/GeneralSettings.qml \
            += src/ui/preferences/DebugWindow.qml \
            += src/ui/MainWindowInner.qml \
            += src/FlightMap/MapItems/VehicleMapItem.qml \
            += src/FlightMap/MapItems/MissionLineView.qml \
            += src/FlightMap/MapItems/MissionItemView.qml \
            += src/FlightMap/MapItems/MissionItemIndicator.qml \
            += src/FlightMap/FlightMap.qml \
            += src/FlightMap/QGCVideoBackground.qml \
            += src/FlightMap/MapScale.qml \
            += src/FlightMap/Widgets/QGCAttitudeHUD.qml \
            += src/FlightMap/Widgets/VibrationWidget.qml \
            += src/FlightMap/Widgets/QGCCompassWidget.qml \
            += src/FlightMap/Widgets/QGCAttitudeWidget.qml \
            += src/FlightMap/Widgets/QGCMapToolButton.qml \
            += src/FlightMap/Widgets/QGCPitchIndicator.qml \
            += src/FlightMap/Widgets/QGCInstrumentWidget.qml \
            += src/FlightMap/Widgets/ValuesWidget.qml \
            += src/FlightMap/Widgets/QGCInstrumentWidgetAlternate.qml \
            += src/FlightMap/Widgets/QGCArtificialHorizon.qml \
            += src/FlightMap/Widgets/InstrumentSwipeView.qml \
            += src/FlightMap/Widgets/QGCWaypointEditor.qml \
            += src/FlightDisplay/FlightDisplayViewDummy.qml \
            += src/FlightDisplay/FlightDisplayViewWidgets.qml \
            += src/FlightDisplay/FlightDisplayViewUVC.qml \
            += src/FlightDisplay/FlightDisplayView.qml \
            += src/FlightDisplay/VirtualJoystick.qml \
            += src/FlightDisplay/FlightDisplayViewMap.qml \
            += src/FlightDisplay/FlightDisplayViewVideo.qml \
            += src/QmlControls/QGCRadioButton.qml \
            += src/QmlControls/SliderSwitch.qml \
            += src/QmlControls/JoystickThumbPad.qml \
            += src/QmlControls/QGCMobileFileDialog.qml \
            += src/QmlControls/QGCMovableItem.qml \
            += src/QmlControls/DropButton.qml \
            += src/QmlControls/MissionItemEditor.qml \
            += src/QmlControls/AppMessages.qml \
            += src/QmlControls/QGCCheckBox.qml \
            += src/QmlControls/SubMenuButton.qml \
            += src/QmlControls/QGCButton.qml \
            += src/QmlControls/QGCViewMessage.qml \
            += src/QmlControls/MultiRotorMotorDisplay.qml \
            += src/QmlControls/QGCViewDialog.qml \
            += src/QmlControls/ModeSwitchDisplay.qml \
            += src/QmlControls/ParameterEditorDialog.qml \
            += src/QmlControls/QGCComboBox.qml \
            += src/QmlControls/QGCPipable.qml \
            += src/QmlControls/ScreenTools.qml \
            += src/QmlControls/QGCTextField.qml \
            += src/QmlControls/IndicatorButton.qml \
            += src/QmlControls/ExclusiveGroupItem.qml \
            += src/QmlControls/QGCToolBarButton.qml \
            += src/QmlControls/VehicleSummaryRow.qml \
            += src/QmlControls/RCChannelMonitor.qml \
            += src/QmlControls/OfflineMapButton.qml \
            += src/QmlControls/QGCLabel.qml \
            += src/QmlControls/QGCFlickable.qml \
            += src/QmlControls/RoundButton.qml \
            += src/QmlControls/QGCFlickableHorizontalIndicator.qml \
            += src/QmlControls/QGCColoredImage.qml \
            += src/QmlControls/QGCViewPanel.qml \
            += src/QmlControls/QGCView.qml \
            += src/QmlControls/FactSliderPanel.qml \
            += src/QmlControls/QGCFlickableVerticalIndicator.qml \
            += src/QmlControls/ClickableColor.qml \
            += src/QmlControls/QmlTest.qml \
            += src/QmlControls/VehicleRotationCal.qml \
            += src/QmlControls/MissionItemIndexLabel.qml \
            += src/QmlControls/QGCSlider.qml \
            += src/QmlControls/MissionCommandDialog.qml \
            += src/QmlControls/ParameterEditor.qml \
            += src/FirmwarePlugin/PX4/PX4GeoFenceEditor.qml \
            += src/FirmwarePlugin/GeoFenceEditor.qml \
            += src/FirmwarePlugin/APM/CopterGeoFenceEditor.qml \
            += src/FirmwarePlugin/APM/PlaneGeoFenceEditor.qml \
            += src/VehicleSetup/SetupView.qml \
            += src/VehicleSetup/SetupParameterEditor.qml \
            += src/VehicleSetup/PX4FlowSensor.qml \
            += src/VehicleSetup/FirmwareUpgrade.qml \
            += src/VehicleSetup/JoystickConfig.qml \
            += src/VehicleSetup/VehicleSummary.qml \
            += src/QtLocationPlugin/QMLControl/OfflineMap.qml \
            += src/FactSystem/FactControls/FactComboBox.qml \
            += src/FactSystem/FactControls/FactPanel.qml \
            += src/FactSystem/FactControls/FactCheckBox.qml \
            += src/FactSystem/FactControls/FactLabel.qml \
            += src/FactSystem/FactControls/FactBitmask.qml \
            += src/FactSystem/FactControls/FactTextField.qml \
            += src/FactSystem/FactSystemTest.qml \
            += src/ViewWidgets/ViewWidget.qml \
            += src/ViewWidgets/LogDownload.qml \
            += src/ViewWidgets/CustomCommandWidget.qml \
            += src/MissionEditor/SimpleItemEditor.qml \
            += src/MissionEditor/SurveyItemEditor.qml \
            += src/MissionEditor/GeoFenceEditor.qml \
            += src/MissionEditor/MissionItemStatus.qml \
            += src/MissionEditor/MissionEditor.qml \
            += src/MissionEditor/QGCMapPolygonControls.qml \
            += src/WeatherStation/WeatherStationSettings.qml \
            += src/WeatherStation/WeatherStation.qml \
            += src/AutoPilotPlugins/PX4/PX4TuningComponentCopter.qml \
            += src/AutoPilotPlugins/PX4/SensorsComponentSummaryFixedWing.qml \
            += src/AutoPilotPlugins/PX4/SafetyComponentSummary.qml \
            += src/AutoPilotPlugins/PX4/PX4TuningComponentVTOL.qml \
            += src/AutoPilotPlugins/PX4/SensorsComponentSummary.qml \
            += src/AutoPilotPlugins/PX4/SafetyComponent.qml \
            += src/AutoPilotPlugins/PX4/PowerComponentSummary.qml \
            += src/AutoPilotPlugins/PX4/PX4FlightModes.qml \
            += src/AutoPilotPlugins/PX4/SensorsComponent.qml \
            += src/AutoPilotPlugins/PX4/PX4TuningComponentPlane.qml \
            += src/AutoPilotPlugins/PX4/AirframeComponentSummary.qml \
            += src/AutoPilotPlugins/PX4/CameraComponent.qml \
            += src/AutoPilotPlugins/PX4/PX4SimpleFlightModes.qml \
            += src/AutoPilotPlugins/PX4/FlightModesComponentSummary.qml \
            += src/AutoPilotPlugins/PX4/PowerComponent.qml \
            += src/AutoPilotPlugins/PX4/PX4AdvancedFlightModes.qml \
            += src/AutoPilotPlugins/PX4/PX4RadioComponentSummary.qml \
            += src/AutoPilotPlugins/PX4/CameraComponentSummary.qml \
            += src/AutoPilotPlugins/PX4/AirframeComponent.qml \
            += src/AutoPilotPlugins/Common/RadioComponent.qml \
            += src/AutoPilotPlugins/Common/MotorComponent.qml \
            += src/AutoPilotPlugins/Common/ESP8266ComponentSummary.qml \
            += src/AutoPilotPlugins/Common/SetupPage.qml \
            += src/AutoPilotPlugins/Common/ESP8266Component.qml \
            += src/AutoPilotPlugins/APM/APMPowerComponent.qml \
            += src/AutoPilotPlugins/APM/APMSafetyComponentSummaryPlane.qml \
            += src/AutoPilotPlugins/APM/APMTuningComponentCopter.qml \
            += src/AutoPilotPlugins/APM/APMRadioComponentSummary.qml \
            += src/AutoPilotPlugins/APM/APMAirframeComponentSummary.qml \
            += src/AutoPilotPlugins/APM/APMFlightModesComponent.qml \
            += src/AutoPilotPlugins/APM/APMFlightModesComponentSummary.qml \
            += src/AutoPilotPlugins/APM/APMSensorsComponent.qml \
            += src/AutoPilotPlugins/APM/APMCameraComponent.qml \
            += src/AutoPilotPlugins/APM/APMPowerComponentSummary.qml \
            += src/AutoPilotPlugins/APM/APMCameraComponentSummary.qml \
            += src/AutoPilotPlugins/APM/APMSafetyComponentRover.qml \
            += src/AutoPilotPlugins/APM/APMNotSupported.qml \
            += src/AutoPilotPlugins/APM/APMSafetyComponentSummaryCopter.qml \
            += src/AutoPilotPlugins/APM/APMSafetyComponentPlane.qml \
            += src/AutoPilotPlugins/APM/APMSafetyComponentCopter.qml \
            += src/AutoPilotPlugins/APM/APMAirframeComponent.qml \
            += src/AutoPilotPlugins/APM/APMSafetyComponentSummaryRover.qml \
            += src/AutoPilotPlugins/APM/APMSensorsComponentSummary.qml \
            += src/test.qml \
}
#End translation QGC

DebugBuild {
    DESTDIR  = $${OUT_PWD}/debug
} else {
    DESTDIR  = $${OUT_PWD}/release
}

# Load additional config flags from user_config.pri
exists(user_config.pri):infile(user_config.pri, CONFIG) {
    CONFIG += $$fromfile(user_config.pri, CONFIG)
    message($$sprintf("Using user-supplied additional config: '%1' specified in user_config.pri", $$fromfile(user_config.pri, CONFIG)))
}

# Bluetooth
contains (DEFINES, QGC_DISABLE_BLUETOOTH) {
    message("Skipping support for Bluetooth (manual override from command line)")
    DEFINES -= QGC_ENABLE_BLUETOOTH
} else:exists(user_config.pri):infile(user_config.pri, DEFINES, QGC_DISABLE_BLUETOOTH) {
    message("Skipping support for Bluetooth (manual override from user_config.pri)")
    DEFINES -= QGC_ENABLE_BLUETOOTH
} else:exists(user_config.pri):infile(user_config.pri, DEFINES, QGC_ENABLE_BLUETOOTH) {
    message("Including support for Bluetooth (manual override from user_config.pri)")
    DEFINES += QGC_ENABLE_BLUETOOTH
}

# USB Camera and UVC Video Sources
contains (DEFINES, QGC_DISABLE_UVC) {
    message("Skipping support for UVC devices (manual override from command line)")
    DEFINES += QGC_DISABLE_UVC
} else:exists(user_config.pri):infile(user_config.pri, DEFINES, QGC_DISABLE_UVC) {
    message("Skipping support for UVC devices (manual override from user_config.pri)")
    DEFINES += QGC_DISABLE_UVC
}

LinuxBuild {
    CONFIG += link_pkgconfig
}

# Qt configuration

CONFIG += qt \
    thread \
    c++11 \

contains(DEFINES, ENABLE_VERBOSE_OUTPUT) {
    message("Enable verbose compiler output (manual override from command line)")
} else:exists(user_config.pri):infile(user_config.pri, DEFINES, ENABLE_VERBOSE_OUTPUT) {
    message("Enable verbose compiler output (manual override from user_config.pri)")
} else {
CONFIG += \
    silent
}

QT += \
    concurrent \
    gui \
    location \
    network \
    opengl \
    positioning \
    qml \
    quick \
    quickwidgets \
    sql \
    svg \
    widgets \
    xml

# Multimedia only used if QVC is enabled
!contains (DEFINES, QGC_DISABLE_UVC) {
    QT += \
        multimedia
}

!MobileBuild {
QT += \
    printsupport \
    serialport \
}

contains(DEFINES, QGC_ENABLE_BLUETOOTH) {
QT += \
    bluetooth \
}

#  testlib is needed even in release flavor for QSignalSpy support
QT += testlib
ReleaseBuild {
    # We don't need the testlib console in release mode
    QT.testlib.CONFIG -= console
}
#
# OS Specific settings
#

MacBuild {
    QMAKE_INFO_PLIST    = Custom-Info.plist
    ICON                = $${BASEDIR}/resources/icons/macx.icns
    OTHER_FILES        += Custom-Info.plist
equals(QT_MAJOR_VERSION, 5) | greaterThan(QT_MINOR_VERSION, 5) {
    LIBS               += -framework ApplicationServices
}
}

iOSBuild {
    BUNDLE.files        = $$files($$PWD/ios/AppIcon*.png) $$PWD/ios/QGCLaunchScreen.xib
    QMAKE_BUNDLE_DATA  += BUNDLE
    LIBS               += -framework AVFoundation
    #-- Info.plist (need an "official" one for the App Store)
    ForAppStore {
        message(App Store Build)
        #-- Create official, versioned Info.plist
        APP_STORE = $$system(cd $${BASEDIR} && $${BASEDIR}/tools/update_ios_version.sh $${BASEDIR}/ios/iOSForAppStore-Info-Source.plist $${BASEDIR}/ios/iOSForAppStore-Info.plist)
        APP_ERROR = $$find(APP_STORE, "Error")
        count(APP_ERROR, 1) {
            error("Error building .plist file. 'ForAppStore' builds are only possible through the official build system.")
        }
        QMAKE_INFO_PLIST  = $${BASEDIR}/ios/iOSForAppStore-Info.plist
        OTHER_FILES      += $${BASEDIR}/ios/iOSForAppStore-Info.plist
    } else {
        QMAKE_INFO_PLIST  = $${BASEDIR}/ios/iOS-Info.plist
        OTHER_FILES      += $${BASEDIR}/ios/iOS-Info.plist
    }
    #-- TODO: Add iTunesArtwork
}

LinuxBuild {
    CONFIG += qesp_linux_udev
}

RC_ICONS = resources/icons/qgroundcontrol.ico
QMAKE_TARGET_COMPANY = "qgroundcontrol.org"
QMAKE_TARGET_DESCRIPTION = "Open source ground control app provided by QGroundControl dev team"
QMAKE_TARGET_COPYRIGHT = "Copyright (C) 2016 QGroundControl Development Team. All rights reserved."
QMAKE_TARGET_PRODUCT = "QGroundControl"

#
# Build-specific settings
#

DebugBuild {
!iOSBuild {
    CONFIG += console
}
}

!MobileBuild {
# qextserialport should not be used by general QGroundControl code. Use QSerialPort instead. This is only
# here to support special case Firmware Upgrade code.
include(libs/qextserialport/src/qextserialport.pri)
}

#
# Our QtLocation "plugin"
#

include(src/QtLocationPlugin/QGCLocationPlugin.pri)

#
# External library configuration
#

include(QGCExternalLibs.pri)

#
# Main QGroundControl portion of project file
#

RESOURCES += \
    qgroundcontrol.qrc \
    qgcresources.qrc

DebugBuild {
    # Unit Test resources
    RESOURCES += UnitTest.qrc
}

DEPENDPATH += \
    . \
    plugins

INCLUDEPATH += .

INCLUDEPATH += \
    include/ui \
    src \
    src/audio \
    src/AutoPilotPlugins \
    src/comm \
    src/FlightDisplay \
    src/FlightMap \
    src/FlightMap/Widgets \
    src/input \
    src/Joystick \
    src/FollowMe \
    src/GPS \
    src/lib/qmapcontrol \
    src/MissionEditor \
    src/MissionManager \
    src/QmlControls \
    src/uas \
    src/ui \
    src/ui/linechart \
    src/ui/map \
    src/ui/mapdisplay \
    src/ui/mission \
    src/ui/px4_configuration \
    src/ui/toolbar \
    src/ui/uas \
    src/VehicleSetup \
    src/ViewWidgets \
    src/QtLocationPlugin \
    src/QtLocationPlugin/QMLControl \
    src/PositionManager \
    src/WeatherStation \
    src/Tsuru \

FORMS += \
    src/ui/MainWindow.ui \
    src/QGCQmlWidgetHolder.ui \

!MobileBuild {
FORMS += \
    src/ui/uas/QGCUnconnectedInfoWidget.ui \
    src/ui/uas/UASMessageView.ui \
    src/ui/Linechart.ui \
    src/ui/MultiVehicleDockWidget.ui \
    src/ui/QGCDataPlot2D.ui \
    src/ui/QGCHilConfiguration.ui \
    src/ui/QGCHilFlightGearConfiguration.ui \
    src/ui/QGCHilJSBSimConfiguration.ui \
    src/ui/QGCHilXPlaneConfiguration.ui \
    src/ui/QGCMapRCToParamDialog.ui \
    src/ui/QGCMAVLinkInspector.ui \
    src/ui/QGCMAVLinkLogPlayer.ui \
    src/ui/QGCTabbedInfoView.ui \
    src/ui/QGCUASFileView.ui \
    src/ui/QGCUASFileViewMulti.ui \
    src/ui/uas/UASQuickView.ui \
    src/ui/uas/UASQuickViewItemSelect.ui \
}

HEADERS += \
    src/audio/QGCAudioWorker.h \
    src/CmdLineOptParser.h \
    src/comm/LinkConfiguration.h \
    src/comm/LinkInterface.h \
    src/comm/LinkManager.h \
    src/comm/MAVLinkProtocol.h \
    src/comm/ProtocolInterface.h \
    src/comm/QGCMAVLink.h \
    src/comm/TCPLink.h \
    src/comm/UDPLink.h \
    src/FlightDisplay/VideoManager.h \
    src/FlightMap/FlightMapSettings.h \
    src/FlightMap/Widgets/ValuesWidgetController.h \
    src/GAudioOutput.h \
    src/HomePositionManager.h \
    src/Joystick/Joystick.h \
    src/Joystick/JoystickManager.h \
    src/VehicleSetup/JoystickConfigController.h \
    src/FollowMe/FollowMe.h \
    src/PositionManager/SimulatedPosition.h \
    src/JsonHelper.h \
    src/LogCompressor.h \
    src/MG.h \
    src/MissionManager/ComplexMissionItem.h \
    src/MissionManager/GeoFenceController.h \
    src/MissionManager/GeoFenceManager.h \
    src/MissionManager/QGCMapPolygon.h \
    src/MissionManager/MissionCommandList.h \
    src/MissionManager/MissionCommandTree.h \
    src/MissionManager/MissionCommandUIInfo.h \
    src/MissionManager/MissionController.h \
    src/MissionManager/MissionItem.h \
    src/MissionManager/MissionManager.h \
    src/MissionManager/PlanElementController.h \
    src/MissionManager/SimpleMissionItem.h \
    src/MissionManager/SurveyMissionItem.h \
    src/MissionManager/VisualMissionItem.h \
    src/QGC.h \
    src/QGCApplication.h \
    src/QGCComboBox.h \
    src/QGCConfig.h \
    src/QGCDockWidget.h \
    src/QGCFileDownload.h \
    src/QGCGeo.h \
    src/QGCLoggingCategory.h \
    src/QGCMapPalette.h \
    src/QGCMobileFileDialogController.h \
    src/QGCPalette.h \
    src/QGCQmlWidgetHolder.h \
    src/QGCQuickWidget.h \
    src/QGCTemporaryFile.h \
    src/QGCToolbox.h \
    src/QmlControls/AppMessages.h \
    src/QmlControls/CoordinateVector.h \
    src/QmlControls/MavlinkQmlSingleton.h \
    src/QmlControls/ParameterEditorController.h \
    src/QmlControls/RCChannelMonitorController.h \
    src/QmlControls/ScreenToolsController.h \
    src/QmlControls/QGroundControlQmlGlobal.h \
    src/QmlControls/QmlObjectListModel.h \
    src/uas/UAS.h \
    src/uas/UASInterface.h \
    src/uas/UASMessageHandler.h \
    src/ui/toolbar/MainToolBarController.h \
    src/AutoPilotPlugins/PX4/PX4AirframeLoader.h \
    src/AutoPilotPlugins/APM/APMAirframeLoader.h \
    src/QmlControls/QGCImageProvider.h \
    src/QtLocationPlugin/QMLControl/QGCMapEngineManager.h \
    src/PositionManager/PositionManager.h \
    src/WeatherStation/WeatherStation.h \
    src/Tsuru/TsuruManager.h

AndroidBuild {
HEADERS += \
}

DebugBuild {
HEADERS += \
    src/comm/MockLink.h \
    src/comm/MockLinkFileServer.h \
    src/comm/MockLinkMissionItemHandler.h \
}

WindowsBuild {
    PRECOMPILED_HEADER += src/stable_headers.h
    HEADERS += src/stable_headers.h
    CONFIG -= silent
    OTHER_FILES += .appveyor.yml
}

contains(DEFINES, QGC_ENABLE_BLUETOOTH) {
    HEADERS += \
    src/comm/BluetoothLink.h \
}

!iOSBuild {
HEADERS += \
    src/comm/QGCSerialPortInfo.h \
    src/comm/SerialLink.h \
}

!MobileBuild {
HEADERS += \
    src/comm/LogReplayLink.h \
    src/comm/QGCFlightGearLink.h \
    src/comm/QGCHilLink.h \
    src/comm/QGCJSBSimLink.h \
    src/comm/QGCXPlaneLink.h \
    src/Joystick/JoystickSDL.h \
    src/QGCFileDialog.h \
    src/QGCMessageBox.h \
    src/uas/FileManager.h \
    src/ui/HILDockWidget.h \
    src/ui/linechart/ChartPlot.h \
    src/ui/linechart/IncrementalPlot.h \
    src/ui/linechart/LinechartPlot.h \
    src/ui/linechart/Linecharts.h \
    src/ui/linechart/LinechartWidget.h \
    src/ui/linechart/Scrollbar.h \
    src/ui/linechart/ScrollZoomer.h \
    src/ui/MainWindow.h \
    src/ui/MAVLinkDecoder.h \
    src/ui/MultiVehicleDockWidget.h \
    src/ui/QGCMAVLinkLogPlayer.h \
    src/ui/QGCMapRCToParamDialog.h \
    src/ui/uas/UASMessageView.h \
    src/ui/uas/QGCUnconnectedInfoWidget.h \
    src/ui/QGCDataPlot2D.h \
    src/ui/QGCHilConfiguration.h \
    src/ui/QGCHilFlightGearConfiguration.h \
    src/ui/QGCHilJSBSimConfiguration.h \
    src/ui/QGCHilXPlaneConfiguration.h \
    src/ui/QGCMAVLinkInspector.h \
    src/ui/QGCTabbedInfoView.h \
    src/ui/QGCUASFileView.h \
    src/ui/QGCUASFileViewMulti.h \
    src/ui/uas/UASQuickView.h \
    src/ui/uas/UASQuickViewGaugeItem.h \
    src/ui/uas/UASQuickViewItem.h \
    src/ui/uas/UASQuickViewItemSelect.h \
    src/ui/uas/UASQuickViewTextItem.h \
    src/GPS/Drivers/src/gps_helper.h \
    src/GPS/Drivers/src/ubx.h \
    src/GPS/definitions.h \
    src/GPS/vehicle_gps_position.h \
    src/GPS/satellite_info.h \
    src/GPS/RTCM/RTCMMavlink.h \
    src/GPS/GPSManager.h \
    src/GPS/GPSPositionMessage.h \
    src/GPS/GPSProvider.h \
    src/ViewWidgets/CustomCommandWidget.h \
    src/ViewWidgets/CustomCommandWidgetController.h \
    src/ViewWidgets/LogDownload.h \
    src/ViewWidgets/LogDownloadController.h \
    src/ViewWidgets/ViewWidgetController.h \
}

iOSBuild {
    OBJECTIVE_SOURCES += \
        src/audio/QGCAudioWorker_iOS.mm \
        src/MobileScreenMgr.mm \
}

AndroidBuild {
    SOURCES += src/MobileScreenMgr.cc \
}


SOURCES += \
    src/audio/QGCAudioWorker.cpp \
    src/CmdLineOptParser.cc \
    src/comm/LinkConfiguration.cc \
    src/comm/LinkManager.cc \
    src/comm/MAVLinkProtocol.cc \
    src/comm/QGCMAVLink.cc \
    src/comm/TCPLink.cc \
    src/comm/UDPLink.cc \
    src/FlightDisplay/VideoManager.cc \
    src/FlightMap/FlightMapSettings.cc \
    src/FlightMap/Widgets/ValuesWidgetController.cc \
    src/GAudioOutput.cc \
    src/HomePositionManager.cc \
    src/Joystick/Joystick.cc \
    src/Joystick/JoystickManager.cc \
    src/VehicleSetup/JoystickConfigController.cc \
    src/JsonHelper.cc \
    src/FollowMe/FollowMe.cc \
    src/LogCompressor.cc \
    src/main.cc \
    src/MissionManager/ComplexMissionItem.cc \
    src/MissionManager/GeoFenceController.cc \
    src/MissionManager/GeoFenceManager.cc \
    src/MissionManager/QGCMapPolygon.cc \
    src/MissionManager/MissionCommandList.cc \
    src/MissionManager/MissionCommandTree.cc \
    src/MissionManager/MissionCommandUIInfo.cc \
    src/MissionManager/MissionController.cc \
    src/MissionManager/MissionItem.cc \
    src/MissionManager/MissionManager.cc \
    src/MissionManager/PlanElementController.cc \
    src/MissionManager/SimpleMissionItem.cc \
    src/MissionManager/SurveyMissionItem.cc \
    src/MissionManager/VisualMissionItem.cc \
    src/QGC.cc \
    src/QGCApplication.cc \
    src/QGCComboBox.cc \
    src/QGCDockWidget.cc \
    src/QGCFileDownload.cc \
    src/QGCLoggingCategory.cc \
    src/QGCMapPalette.cc \
    src/QGCMobileFileDialogController.cc \
    src/QGCPalette.cc \
    src/QGCQuickWidget.cc \
    src/QGCQmlWidgetHolder.cpp \
    src/QGCTemporaryFile.cc \
    src/QGCToolbox.cc \
    src/QGCGeo.cc \
    src/QmlControls/AppMessages.cc \
    src/QmlControls/CoordinateVector.cc \
    src/QmlControls/ParameterEditorController.cc \
    src/QmlControls/RCChannelMonitorController.cc \
    src/QmlControls/ScreenToolsController.cc \
    src/QmlControls/QGroundControlQmlGlobal.cc \
    src/QmlControls/QmlObjectListModel.cc \
    src/uas/UAS.cc \
    src/uas/UASMessageHandler.cc \
    src/ui/toolbar/MainToolBarController.cc \
    src/AutoPilotPlugins/PX4/PX4AirframeLoader.cc \
    src/AutoPilotPlugins/APM/APMAirframeLoader.cc \
    src/QmlControls/QGCImageProvider.cc \
    src/QtLocationPlugin/QMLControl/QGCMapEngineManager.cc \
    src/PositionManager/SimulatedPosition.cc \
    src/PositionManager/PositionManager.cpp \
    src/WeatherStation/WeatherStation.cpp \
    src/Tsuru/TsuruManager.cpp

DebugBuild {
SOURCES += \
    src/comm/MockLink.cc \
    src/comm/MockLinkFileServer.cc \
    src/comm/MockLinkMissionItemHandler.cc \
}

!iOSBuild {
SOURCES += \
    src/comm/QGCSerialPortInfo.cc \
    src/comm/SerialLink.cc \
}

contains(DEFINES, QGC_ENABLE_BLUETOOTH) {
    SOURCES += \
    src/comm/BluetoothLink.cc \
}

!MobileBuild {
SOURCES += \
    src/ui/uas/UASMessageView.cc \
    src/uas/FileManager.cc \
    src/ui/uas/QGCUnconnectedInfoWidget.cc \
    src/ui/MAVLinkDecoder.cc \
    src/ui/QGCMapRCToParamDialog.cpp \
    src/comm/LogReplayLink.cc \
    src/QGCFileDialog.cc \
    src/ui/QGCMAVLinkLogPlayer.cc \
    src/comm/QGCFlightGearLink.cc \
    src/comm/QGCJSBSimLink.cc \
    src/comm/QGCXPlaneLink.cc \
    src/Joystick/JoystickSDL.cc \
    src/ui/HILDockWidget.cc \
    src/ui/linechart/ChartPlot.cc \
    src/ui/linechart/IncrementalPlot.cc \
    src/ui/linechart/LinechartPlot.cc \
    src/ui/linechart/Linecharts.cc \
    src/ui/linechart/LinechartWidget.cc \
    src/ui/linechart/Scrollbar.cc \
    src/ui/linechart/ScrollZoomer.cc \
    src/ui/MainWindow.cc \
    src/ui/MultiVehicleDockWidget.cc \
    src/ui/QGCDataPlot2D.cc \
    src/ui/QGCHilConfiguration.cc \
    src/ui/QGCHilFlightGearConfiguration.cc \
    src/ui/QGCHilJSBSimConfiguration.cc \
    src/ui/QGCHilXPlaneConfiguration.cc \
    src/ui/QGCMAVLinkInspector.cc \
    src/ui/QGCTabbedInfoView.cpp \
    src/ui/QGCUASFileView.cc \
    src/ui/QGCUASFileViewMulti.cc \
    src/ui/uas/UASQuickView.cc \
    src/ui/uas/UASQuickViewGaugeItem.cc \
    src/ui/uas/UASQuickViewItem.cc \
    src/ui/uas/UASQuickViewItemSelect.cc \
    src/ui/uas/UASQuickViewTextItem.cc \
    src/GPS/Drivers/src/gps_helper.cpp \
    src/GPS/Drivers/src/ubx.cpp \
    src/GPS/RTCM/RTCMMavlink.cc \
    src/GPS/GPSManager.cc \
    src/GPS/GPSProvider.cc \
    src/ViewWidgets/CustomCommandWidget.cc \
    src/ViewWidgets/CustomCommandWidgetController.cc \
    src/ViewWidgets/LogDownload.cc \
    src/ViewWidgets/LogDownloadController.cc \
    src/ViewWidgets/ViewWidgetController.cc
}

#
# Unit Test specific configuration goes here
#

DebugBuild {

HEADERS += src/QmlControls/QmlTestWidget.h
SOURCES += src/QmlControls/QmlTestWidget.cc

!MobileBuild {

INCLUDEPATH += \
    src/qgcunittest

HEADERS += \
    src/FactSystem/FactSystemTestBase.h \
    src/FactSystem/FactSystemTestGeneric.h \
    src/FactSystem/FactSystemTestPX4.h \
    src/MissionManager/ComplexMissionItemTest.h \
    src/MissionManager/MissionCommandTreeTest.h \
    src/MissionManager/MissionControllerTest.h \
    src/MissionManager/MissionControllerManagerTest.h \
    src/MissionManager/MissionItemTest.h \
    src/MissionManager/MissionManagerTest.h \
    src/MissionManager/SimpleMissionItemTest.h \
    src/qgcunittest/GeoTest.h \
    src/qgcunittest/FileDialogTest.h \
    src/qgcunittest/FileManagerTest.h \
    src/qgcunittest/FlightGearTest.h \
    src/qgcunittest/LinkManagerTest.h \
    src/qgcunittest/MainWindowTest.h \
    src/qgcunittest/MavlinkLogTest.h \
    src/qgcunittest/MessageBoxTest.h \
    src/qgcunittest/MultiSignalSpy.h \
    src/qgcunittest/ParameterLoaderTest.h \
    src/qgcunittest/RadioConfigTest.h \
    src/qgcunittest/TCPLinkTest.h \
    src/qgcunittest/TCPLoopBackServer.h \
    src/qgcunittest/UnitTest.h \
    src/ViewWidgets/LogDownloadTest.h \
    src/VehicleSetup/SetupViewTest.h \

SOURCES += \
    src/FactSystem/FactSystemTestBase.cc \
    src/FactSystem/FactSystemTestGeneric.cc \
    src/FactSystem/FactSystemTestPX4.cc \
    src/MissionManager/ComplexMissionItemTest.cc \
    src/MissionManager/MissionCommandTreeTest.cc \
    src/MissionManager/MissionControllerTest.cc \
    src/MissionManager/MissionControllerManagerTest.cc \
    src/MissionManager/MissionItemTest.cc \
    src/MissionManager/MissionManagerTest.cc \
    src/MissionManager/SimpleMissionItemTest.cc \
    src/qgcunittest/GeoTest.cc \
    src/qgcunittest/FileDialogTest.cc \
    src/qgcunittest/FileManagerTest.cc \
    src/qgcunittest/FlightGearTest.cc \
    src/qgcunittest/LinkManagerTest.cc \
    src/qgcunittest/MainWindowTest.cc \
    src/qgcunittest/MavlinkLogTest.cc \
    src/qgcunittest/MessageBoxTest.cc \
    src/qgcunittest/MultiSignalSpy.cc \
    src/qgcunittest/ParameterLoaderTest.cc \
    src/qgcunittest/RadioConfigTest.cc \
    src/qgcunittest/TCPLinkTest.cc \
    src/qgcunittest/TCPLoopBackServer.cc \
    src/qgcunittest/UnitTest.cc \
    src/qgcunittest/UnitTestList.cc \
    src/ViewWidgets/LogDownloadTest.cc \
    src/VehicleSetup/SetupViewTest.cc \
} # !MobileBuild
} # DebugBuild

#
# Firmware Plugin Support
#

INCLUDEPATH += \
    src/AutoPilotPlugins/APM \
    src/AutoPilotPlugins/Common \
    src/AutoPilotPlugins/PX4 \
    src/FirmwarePlugin \
    src/FirmwarePlugin/APM \
    src/FirmwarePlugin/PX4 \
    src/Vehicle \
    src/VehicleSetup \

HEADERS+= \
    src/AutoPilotPlugins/AutoPilotPlugin.h \
    src/AutoPilotPlugins/AutoPilotPluginManager.h \
    src/AutoPilotPlugins/APM/APMAutoPilotPlugin.h \
    src/AutoPilotPlugins/APM/APMAirframeComponent.h \
    src/AutoPilotPlugins/APM/APMAirframeComponentController.h \
    src/AutoPilotPlugins/APM/APMAirframeComponentAirframes.h \
    src/AutoPilotPlugins/APM/APMCameraComponent.h \
    src/AutoPilotPlugins/APM/APMCompassCal.h \
    src/AutoPilotPlugins/APM/APMFlightModesComponent.h \
    src/AutoPilotPlugins/APM/APMFlightModesComponentController.h \
    src/AutoPilotPlugins/APM/APMPowerComponent.h \
    src/AutoPilotPlugins/APM/APMRadioComponent.h \
    src/AutoPilotPlugins/APM/APMSafetyComponent.h \
    src/AutoPilotPlugins/APM/APMSensorsComponent.h \
    src/AutoPilotPlugins/APM/APMSensorsComponentController.h \
    src/AutoPilotPlugins/APM/APMTuningComponent.h \
    src/AutoPilotPlugins/Common/MotorComponent.h \
    src/AutoPilotPlugins/Common/RadioComponentController.h \
    src/AutoPilotPlugins/Common/ESP8266ComponentController.h \
    src/AutoPilotPlugins/Common/ESP8266Component.h \
    src/AutoPilotPlugins/Generic/GenericAutoPilotPlugin.h \
    src/AutoPilotPlugins/PX4/AirframeComponent.h \
    src/AutoPilotPlugins/PX4/AirframeComponentAirframes.h \
    src/AutoPilotPlugins/PX4/AirframeComponentController.h \
    src/AutoPilotPlugins/PX4/FlightModesComponent.h \
    src/AutoPilotPlugins/PX4/PX4AdvancedFlightModesController.h \
    src/AutoPilotPlugins/PX4/PX4SimpleFlightModesController.h \
    src/AutoPilotPlugins/PX4/PowerComponent.h \
    src/AutoPilotPlugins/PX4/PowerComponentController.h \
    src/AutoPilotPlugins/PX4/PX4AutoPilotPlugin.h \
    src/AutoPilotPlugins/PX4/PX4RadioComponent.h \
    src/AutoPilotPlugins/PX4/CameraComponent.h \
    src/AutoPilotPlugins/PX4/SafetyComponent.h \
    src/AutoPilotPlugins/PX4/SensorsComponent.h \
    src/AutoPilotPlugins/PX4/SensorsComponentController.h \
    src/AutoPilotPlugins/PX4/PX4TuningComponent.h \
    src/FirmwarePlugin/FirmwarePluginManager.h \
    src/FirmwarePlugin/FirmwarePlugin.h \
    src/FirmwarePlugin/APM/APMFirmwarePlugin.h \
    src/FirmwarePlugin/APM/APMGeoFenceManager.h \
    src/FirmwarePlugin/APM/APMParameterMetaData.h \
    src/FirmwarePlugin/APM/ArduCopterFirmwarePlugin.h \
    src/FirmwarePlugin/APM/ArduPlaneFirmwarePlugin.h \
    src/FirmwarePlugin/APM/ArduRoverFirmwarePlugin.h \
    src/FirmwarePlugin/APM/ArduSubFirmwarePlugin.h \
    src/FirmwarePlugin/PX4/px4_custom_mode.h \
    src/FirmwarePlugin/PX4/PX4FirmwarePlugin.h \
    src/FirmwarePlugin/PX4/PX4GeoFenceManager.h \
    src/FirmwarePlugin/PX4/PX4ParameterMetaData.h \
    src/Vehicle/MultiVehicleManager.h \
    src/Vehicle/Vehicle.h \
    src/VehicleSetup/VehicleComponent.h \

!MobileBuild {
HEADERS += \
    src/VehicleSetup/FirmwareUpgradeController.h \
    src/VehicleSetup/Bootloader.h \
    src/VehicleSetup/PX4FirmwareUpgradeThread.h \
    src/VehicleSetup/FirmwareImage.h \

}

SOURCES += \
    src/AutoPilotPlugins/AutoPilotPlugin.cc \
    src/AutoPilotPlugins/AutoPilotPluginManager.cc \
    src/AutoPilotPlugins/APM/APMAutoPilotPlugin.cc \
    src/AutoPilotPlugins/APM/APMAirframeComponent.cc \
    src/AutoPilotPlugins/APM/APMAirframeComponentController.cc \
    src/AutoPilotPlugins/APM/APMCameraComponent.cc \
    src/AutoPilotPlugins/APM/APMCompassCal.cc \
    src/AutoPilotPlugins/APM/APMFlightModesComponent.cc \
    src/AutoPilotPlugins/APM/APMFlightModesComponentController.cc \
    src/AutoPilotPlugins/APM/APMPowerComponent.cc \
    src/AutoPilotPlugins/APM/APMRadioComponent.cc \
    src/AutoPilotPlugins/APM/APMSafetyComponent.cc \
    src/AutoPilotPlugins/APM/APMSensorsComponent.cc \
    src/AutoPilotPlugins/APM/APMSensorsComponentController.cc \
    src/AutoPilotPlugins/APM/APMTuningComponent.cc \
    src/AutoPilotPlugins/Common/MotorComponent.cc \
    src/AutoPilotPlugins/Common/RadioComponentController.cc \
    src/AutoPilotPlugins/Common/ESP8266ComponentController.cc \
    src/AutoPilotPlugins/Common/ESP8266Component.cc \
    src/AutoPilotPlugins/APM/APMAirframeComponentAirframes.cc \
    src/AutoPilotPlugins/Generic/GenericAutoPilotPlugin.cc \
    src/AutoPilotPlugins/PX4/AirframeComponent.cc \
    src/AutoPilotPlugins/PX4/AirframeComponentAirframes.cc \
    src/AutoPilotPlugins/PX4/AirframeComponentController.cc \
    src/AutoPilotPlugins/PX4/FlightModesComponent.cc \
    src/AutoPilotPlugins/PX4/PX4AdvancedFlightModesController.cc \
    src/AutoPilotPlugins/PX4/PX4SimpleFlightModesController.cc \
    src/AutoPilotPlugins/PX4/PowerComponent.cc \
    src/AutoPilotPlugins/PX4/PowerComponentController.cc \
    src/AutoPilotPlugins/PX4/PX4AutoPilotPlugin.cc \
    src/AutoPilotPlugins/PX4/PX4RadioComponent.cc \
    src/AutoPilotPlugins/PX4/CameraComponent.cc \
    src/AutoPilotPlugins/PX4/SafetyComponent.cc \
    src/AutoPilotPlugins/PX4/SensorsComponent.cc \
    src/AutoPilotPlugins/PX4/SensorsComponentController.cc \
    src/AutoPilotPlugins/PX4/PX4TuningComponent.cc \
    src/FirmwarePlugin/APM/APMFirmwarePlugin.cc \
    src/FirmwarePlugin/APM/APMGeoFenceManager.cc \
    src/FirmwarePlugin/APM/APMParameterMetaData.cc \
    src/FirmwarePlugin/APM/ArduCopterFirmwarePlugin.cc \
    src/FirmwarePlugin/APM/ArduPlaneFirmwarePlugin.cc \
    src/FirmwarePlugin/APM/ArduRoverFirmwarePlugin.cc \
    src/FirmwarePlugin/APM/ArduSubFirmwarePlugin.cc \
    src/FirmwarePlugin/FirmwarePlugin.cc \
    src/FirmwarePlugin/FirmwarePluginManager.cc \
    src/FirmwarePlugin/PX4/PX4FirmwarePlugin.cc \
    src/FirmwarePlugin/PX4/PX4GeoFenceManager.cc \
    src/FirmwarePlugin/PX4/PX4ParameterMetaData.cc \
    src/Vehicle/MultiVehicleManager.cc \
    src/Vehicle/Vehicle.cc \
    src/VehicleSetup/VehicleComponent.cc \

!MobileBuild {
SOURCES += \
    src/VehicleSetup/FirmwareUpgradeController.cc \
    src/VehicleSetup/Bootloader.cc \
    src/VehicleSetup/PX4FirmwareUpgradeThread.cc \
    src/VehicleSetup/FirmwareImage.cc \

}

# Fact System code

INCLUDEPATH += \
    src/FactSystem \
    src/FactSystem/FactControls \

HEADERS += \
    src/FactSystem/Fact.h \
    src/FactSystem/FactGroup.h \
    src/FactSystem/FactControls/FactPanelController.h \
    src/FactSystem/FactMetaData.h \
    src/FactSystem/FactSystem.h \
    src/FactSystem/FactValidator.h \
    src/FactSystem/ParameterLoader.h \
    src/FactSystem/SettingsFact.h \

SOURCES += \
    src/FactSystem/Fact.cc \
    src/FactSystem/FactGroup.cc \
    src/FactSystem/FactControls/FactPanelController.cc \
    src/FactSystem/FactMetaData.cc \
    src/FactSystem/FactSystem.cc \
    src/FactSystem/FactValidator.cc \
    src/FactSystem/ParameterLoader.cc \
    src/FactSystem/SettingsFact.cc \

#-------------------------------------------------------------------------------------
# Video Streaming

INCLUDEPATH += \
    src/VideoStreaming

HEADERS += \
    src/VideoStreaming/VideoItem.h \
    src/VideoStreaming/VideoReceiver.h \
    src/VideoStreaming/VideoStreaming.h \
    src/VideoStreaming/VideoSurface.h \
    src/VideoStreaming/VideoSurface_p.h \

SOURCES += \
    src/VideoStreaming/VideoItem.cc \
    src/VideoStreaming/VideoReceiver.cc \
    src/VideoStreaming/VideoStreaming.cc \
    src/VideoStreaming/VideoSurface.cc \

contains (CONFIG, DISABLE_VIDEOSTREAMING) {
    message("Skipping support for video streaming (manual override from command line)")
# Otherwise the user can still disable this feature in the user_config.pri file.
} else:exists(user_config.pri):infile(user_config.pri, DEFINES, DISABLE_VIDEOSTREAMING) {
    message("Skipping support for video streaming (manual override from user_config.pri)")
} else {
    include(src/VideoStreaming/VideoStreaming.pri)
}

#-------------------------------------------------------------------------------------
# Android

AndroidBuild {
    include($$PWD/libs/qtandroidserialport/src/qtandroidserialport.pri)
    message("Adding Serial Java Classes")
    QT += androidextras
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += \
        $$PWD/android/AndroidManifest.xml \
        $$PWD/android/res/xml/device_filter.xml \
        $$PWD/android/src/com/hoho/android/usbserial/driver/CdcAcmSerialDriver.java \
        $$PWD/android/src/com/hoho/android/usbserial/driver/CommonUsbSerialDriver.java \
        $$PWD/android/src/com/hoho/android/usbserial/driver/Cp2102SerialDriver.java \
        $$PWD/android/src/com/hoho/android/usbserial/driver/FtdiSerialDriver.java \
        $$PWD/android/src/com/hoho/android/usbserial/driver/ProlificSerialDriver.java \
        $$PWD/android/src/com/hoho/android/usbserial/driver/UsbId.java \
        $$PWD/android/src/com/hoho/android/usbserial/driver/UsbSerialDriver.java \
        $$PWD/android/src/com/hoho/android/usbserial/driver/UsbSerialProber.java \
        $$PWD/android/src/com/hoho/android/usbserial/driver/UsbSerialRuntimeException.java \
        $$PWD/android/src/org/qgroundcontrol/qgchelper/UsbDeviceJNI.java \
        $$PWD/android/src/org/qgroundcontrol/qgchelper/UsbIoManager.java

    DISTFILES += \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat
}

#-------------------------------------------------------------------------------------
#
# Post link configuration
#

include(QGCSetup.pri)

#
# Installer targets
#

include(QGCInstaller.pri)

DISTFILES += \
    translations/qgc_ru.ts
