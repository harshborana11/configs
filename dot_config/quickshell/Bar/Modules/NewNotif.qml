import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import "../../Utils" as Utils
import "root:/"

Item {
    id: root
    required property var screen
    required property var anchor_window
    PopupWindow {
        id: win
        anchor.window: anchor_window
        anchor.rect.x: parent.width + 100
        anchor.rect.y: 48
        visible: Utils.NotifServer.show_new_notification && Utils.NotifServer.dnd
        color: "transparent"
        implicitWidth: Theme.notif_width + 10
        implicitHeight: Theme.notif_height

        Rectangle {
            visible: Utils.NotifServer.show_new_notification
            implicitWidth: Theme.notif_width
            implicitHeight: visible ? Theme.notif_height : 0
            color: "transparent"
            NotifContents {
                notification: Utils.NotifServer.latest_notification
            }
        }
    }
}
