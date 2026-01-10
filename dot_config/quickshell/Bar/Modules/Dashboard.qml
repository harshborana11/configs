import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris
import Quickshell.Hyprland
import Quickshell.Io
import "../../Utils" as Utils
import "root:/"

Item {
    id: root
    required property var screen
    required property var anchor_window
    PopupWindow {
        id: win
        anchor.window: anchor_window
        anchor.rect.x: 0
        anchor.rect.y: 48
        visible: Utils.DashboardState.show
        color: "transparent"
        implicitWidth: 640
        implicitHeight: 425

        HoverHandler {
            id: dashboardHover
            onHoveredChanged: {
                if (!hovered) {
                    closeTimer.start();
                } else {
                    closeTimer.stop();
                }
            }
        }
        Rectangle {
            color: Colors.background
            implicitWidth: 640
            implicitHeight: 425
            radius: 20
            Rectangle {
                id: settingsBox
                Timer {
                    id: closeTimer
                    interval: 1000
                    repeat: false
                    onTriggered: {
                        Utils.DashboardState.show = false;
                    }
                }
                anchors.left: parent.left
                radius: 20
                color: Colors.background
                implicitHeight: parent.height
                implicitWidth: 330
                SettingsPanel {
                    id:settings
                    anchors {
                        margins: 22
                        horizontalCenter: parent.horizontalCenter
                        top:junimos.bottom
                    }
                }
                Rectangle {
                    id:junimos
                    implicitHeight: 75
                    implicitWidth: 310
                    color: Colors.accentActive
                    border {
                        color: Colors.foreground
                        width: 2
                    }
                    radius: 20
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        margins: 30
                    }
                         AnimatedImage {
                             id: myImage
                             source: "root:/assets/junimos.gif"
                             fillMode: Image.PreserveAspectFit
                             anchors.fill: parent
                         }
                }

                Rectangle {
                    implicitHeight: 80
                    implicitWidth: 310
                    color: Colors.background
                    border {
                        color: Colors.foreground
                        width: 2
                    }
                    radius: 20
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: settings.bottom
                        margins: 21
                    }

                    Rectangle{
                        implicitHeight: 75
                        implicitWidth: 300
                        anchors.centerIn:parent
                        color:"transparent"
                    RowLayout {
                        anchors.fill: parent
                        spacing: Theme.dashboard_margin

                        Rectangle {
                            color: Colors.bg0
                            radius: 20
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            ScrollView {
                                anchors.fill: parent
                                anchors.margins: Theme.dashboard_margin
                                clip: true

                                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                                ScrollBar.vertical.policy: ScrollBar.AsNeeded

                                ColumnLayout {
                                    width: parent.width
                                    spacing: Theme.dashboard_margin

                                    Repeater {
                                        model: Mpris.players
                                        delegate: DashboardMediaPlayer {}
                                    }
                                }
                            }
                        }
                        }
                    }
                }            }
            Rectangle {
                width: 280
                implicitHeight: parent.height - 15
                color: "transparent"
                anchors {
                    left: settingsBox.right
                    margins: 10
                }
                Notif {}
            }
        }
    }
}
