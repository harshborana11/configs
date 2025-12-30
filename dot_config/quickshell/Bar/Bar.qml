//@ pragma UseQApplication

import QtQuick
import Quickshell
import "Modules" as Modules
import "../Utils" as Utils

PanelWindow {
    id: panel
    property var panelWindow: null
    implicitHeight: 40
    color: "transparent"
    anchors {
        left: true
        right: true
        top: true
    }

    required property var modelData

        screen: modelData

    Modules.Workspaces {}
    Modules.Clock {}
    Modules.DashboardToggle {
                       icon: Utils.NotifServer.show_notifications ? "󰂚" : "󰂛"
                       is_active: Utils.NotifServer.show_notifications
                       toggle: function() {
                           Utils.NotifServer.show_notifications = !Utils.NotifServer.show_notifications
                       }
                       anchors{
                           right:parent.right
                           margins:80
                       }
                   }
    Modules.SystemTray {
        panelWindow: panel
    }
    Modules.Notif {
            anchor_window: panel
            screen: modelData
        }
}
