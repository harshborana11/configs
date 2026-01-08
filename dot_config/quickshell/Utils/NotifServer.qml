pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root
    property int notif_lifetime_seconds: 1
    property alias notif_server: notif_server
    property bool dnd: true
    property bool show_new_notification: false
    property var latest_notification: null
    Timer {
        id: timer
        interval: Utils.NotifServer.notif_lifetime_seconds * 2000
        running: true
        repeat: false
        onTriggered: {
            root.show_new_notification = false;
        }
    }
    NotificationServer {
        id: notif_server

        onNotification: function (notif) {
            root.show_new_notification = true;
            notif.tracked = true;
            root.latest_notification = notif;
            notif.received_at = Datetime.time;
            timer.start();
        }
    }
}
