import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import "../../Utils" as Utils
import "root:/"

Item {
    id: root

    Rectangle {
        width: 290
        implicitHeight: parent.parent.height - 40
        anchors.top: parent.top
        anchors.margins: 30

        color: Colors.bg0
        ScrollBar.vertical: ScrollBar {
            active: hovered || pressed
            policy: ScrollBar.AsNeeded
        }
        radius: 20
        border {
            color: Colors.foreground
            width: 2
        }

        Rectangle {
            id: title
            width: parent.width - 20
            height: 25
            color: Colors.bg2
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                margins: 15
            }
            radius: 30
            Text {
                text: "Notifications"
                color: Colors.foreground
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    margins: 10
                }
            }
        }

        Rectangle {
            width: 280
            implicitHeight: parent.height - 50
            anchors.top: title.bottom
            anchors.left: parent.left
            anchors.margins: 5
            radius: 20
            color: Colors.bg0

            ScrollBar.vertical: ScrollBar {
                active: hovered || pressed
                policy: ScrollBar.AsNeeded
            }

            Text {
                text: "No Notifications yet"
                color: Colors.foreground
                anchors {
                    verticalCenter: parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                    margins: 10
                }
                visible: notifListView.contentHeight < 1
            }

            ListView {
                id: notifListView
                anchors.fill: parent
                anchors.margins: 15
                spacing: 10
                clip: true
                model: Utils.NotifServer.notif_server.trackedNotifications
                ScrollBar.vertical: ScrollBar {
                    parent: win
                    anchors.right: parent.right
                    active: hovered || pressed
                    policy: ScrollBar.AsNeeded
                }

                delegate: Item {
                    height: Theme.notif_height
                    Rectangle {
                        id: win
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
}
