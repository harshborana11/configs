import QtQuick
import Quickshell.Hyprland
import "../../"
import "../../Utils" as Utils

Rectangle {
    color: Colors.background
    implicitHeight: 38
    implicitWidth: Utils.HyprlandUtils.maxWorkspace * 33
    radius: 100
    anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
        margins: 2
    }
    Row {
        anchors.centerIn: parent
        spacing: 15

        Repeater {
            model: Utils.HyprlandUtils.maxWorkspace || 5
            Item {
                required property int index
                property bool focused: Hyprland.focusedMonitor?.activeWorkspace?.id === (index + 1)

                width: workspaceText.width
                height: workspaceText.height

                Text {
                    id: workspaceText
                    text: focused ? "" : ""
                    color: Colors.foreground
                    font.pixelSize: 15
                    font.bold: focused
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: Utils.HyprlandUtils.switchWorkspace(index + 1)
                }
            }
        }
    }
}
