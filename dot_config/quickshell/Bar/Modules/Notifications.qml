import QtQuick
import QtQuick.Controls
import Quickshell
import "../../Utils" as Utils
import "root:/"

Item {
    id: root
    required property var screen
    required property var anchor_window

    property int notificationTimeout: 5000

    PopupWindow {
        id: latestNotifWin

        anchor.window: anchor_window
        anchor.rect.x: 0
        anchor.rect.y: 48
        color: Colors.background
        implicitWidth: 300
        implicitHeight:  Utils.NotifServer.show_new_notification  ?  140:500

        visible: Utils.NotifServer.show_new_notification


        NotifContents {
            notification: Utils.NotifServer.notif_server.trackedNotifications[1] || null
        }
    }

    Timer {
        id: hideTimer
        interval: notificationTimeout
        running: latestNotifWin.visible
        repeat: false
        onTriggered: {
            Utils.NotifServer.show_new_notification = false
        }
    }

    Connections {
        target: Utils.NotifServer.notif_server
        function onTrackedNotificationsChanged() {
            if (Utils.NotifServer.notif_server.trackedNotifications.length > 0) {
                Utils.NotifServer.show_new_notification = true
                hideTimer.restart()
            }
        }
    }
}
