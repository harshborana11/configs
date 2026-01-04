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

        ScrollBar.vertical: ScrollBar {
            active: hovered || pressed
            policy: ScrollBar.AsNeeded
        }
        anchor.window: anchor_window
        anchor.rect.x: parent.width
        anchor.rect.y: 48
        visible: true
        color: "transparent"
        implicitWidth: 280
        implicitHeight: (Utils.NotifServer.show_notifications || Utils.NotifServer.show_new_notification) ? 500 : 1
        ListView {
            id: notifListView
            anchors.fill: parent
            spacing: 10
            clip: false
            model: Utils.NotifServer.notif_server.trackedNotifications
            verticalLayoutDirection: ListView.TopToBottom
            onCountChanged: {
                if (count > 0) {
                    Qt.callLater(() => {
                        notifListView.positionViewAtIndex(0, ListView.Beginning);
                    });
                }
            }

            ScrollBar.vertical: ScrollBar {
                parent: win
                anchors.right: parent.right
                active: hovered || pressed
                policy: ScrollBar.AsNeeded
            }

            delegate: Item {
                property bool is_fresh: true
                height: (Utils.NotifServer.show_notifications || is_fresh) ? Theme.notif_height : 0
                Timer {
                    interval: Utils.NotifServer.notif_lifetime_seconds * 1000
                    running: true
                    repeat: false
                    onTriggered: {
                        is_fresh = false;
                        Utils.NotifServer.show_new_notification = false;
                    }
                }
                Rectangle {
                    id: win
                    visible: Utils.NotifServer.show_notifications || is_fresh
                    color: "transparent"
                    implicitWidth: Theme.notif_width
                    implicitHeight: visible ? Theme.notif_height : 0
                    NotifContents {
                        notification: modelData
                    }
                }
            }
        }
    }
}
