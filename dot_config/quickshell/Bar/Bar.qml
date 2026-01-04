//@ pragma UseQApplication

import QtQuick
import Quickshell
import QtQuick.Controls
import "Modules" as Modules
import "../Utils" as Utils
import "../"

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

    Modules.DashboardToggle {
      icon: Utils.DashboardState.show ? "󱋙" : ""
        is_active: Utils.DashboardState.show
        color:  Colors.background
        toggle: function () {
            Utils.DashboardState.show = !Utils.DashboardState.show;
        }
        anchors {
            left: parent.left
            margins: 5
        }
    }
    Modules.Workspaces {}
    Modules.Clock {}
    Modules.DashboardToggle {
        icon: Utils.NotifServer.show_notifications ? "󰂚" : "󰂛"
        is_active: Utils.NotifServer.show_notifications
        toggle: function () {
            Utils.NotifServer.show_notifications = !Utils.NotifServer.show_notifications;
        }
        anchors {
            right: parent.right
            margins: 75
        }
    }
    Modules.SystemTray {
        panelWindow: panel
    }
    Modules.Notif {
        anchor_window: panel
        screen: modelData
    }

    Modules.Dashboard {
        anchor_window: panel
        screen: modelData
    }
}
