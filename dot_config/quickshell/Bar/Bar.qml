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
        color: Colors.background
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
        icon: Utils.NotifServer.dnd ? "󰂚" : "󰂛"
        is_active: Utils.NotifServer.dnd
        toggle: function () {
            Utils.NotifServer.dnd = !Utils.NotifServer.dnd;
        }
        anchors {
            right: parent.right
            margins: 75
        }
    }
    Modules.SystemTray {
        panelWindow: panel
    }

    Modules.NewNotif {
        anchor_window: panel
        screen: modelData
    }
    Modules.Dashboard {
        anchor_window: panel
        screen: modelData
    }
}
