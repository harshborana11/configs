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
        implicitWidth: 350
        implicitHeight: 420

        Rectangle {
            Timer {
                id: closeTimer
                interval: 1000
                repeat: false
                onTriggered: {
                    Utils.DashboardState.show = false;
                }
            }
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
            anchors.fill: parent
            radius: 20
            color: Colors.background
            SettingsPanel {}
            Rectangle{
              implicitHeight:150
              implicitWidth: 310
              color:Colors.background
    border {
        color: Colors.foreground
        width: 2
    }
              radius:20
              anchors{
                horizontalCenter: parent.horizontalCenter
                top:parent.top
                margins:230
              }
              Text{
                text: "media player to be added"
        color: Colors.foreground
              anchors{
                centerIn: parent
              }

              }
            }
        }
    }
}
