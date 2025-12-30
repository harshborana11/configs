import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../Utils" as Utils

Item {
    id: root

    required property var screen

    required property var anchor_window

    Repeater {
        model: Utils.NotifServer.notif_server.trackedNotifications

        delegate: Item {
            PopupWindow {
                id: win

                anchor.window: anchor_window
                anchor.rect.x: anchor_window.width - Theme.notif_width - Theme.bar_left_right_gap
                anchor.rect.y: anchor_window.height + Theme.notif_gap + (Theme.notif_gap + Theme.notif_height) * model.index

                screen: root.screen

                visible: Utils.NotifServer.show_notifications

                color: "transparent"

                implicitWidth: Theme.notif_width
                implicitHeight: Theme.notif_height

                NotifContents {
                    notification: modelData
                }
            }
        }
    }
}
