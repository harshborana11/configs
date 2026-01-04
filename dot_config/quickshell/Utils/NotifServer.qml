pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property int notif_lifetime_seconds: 1

    property alias notif_server: notif_server

    property bool show_notifications: false
    property bool show_new_notification: false

    NotificationServer {
        id: notif_server

        onNotification: function (notif) {
            root.show_new_notification = true;
            console.log(root.show_new_notification);
            notif.tracked = true;
            notif.received_at = Datetime.time;
        }
    }
}
