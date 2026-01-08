import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
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
                SettingsPanel {}
                Rectangle {
                    implicitHeight: 170
                    implicitWidth: 310
                    color: Colors.background
                    border {
                        color: Colors.foreground
                        width: 2
                    }
                    radius: 20
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        top: parent.top
                        margins: 230
                    }
                    Text {
                        text: "media player to be added"
                        color: Colors.foreground
                        anchors {
                            centerIn: parent
                        }
                    }
                }
            }
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
