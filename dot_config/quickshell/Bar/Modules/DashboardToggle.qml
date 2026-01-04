import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../"

Rectangle {
    id: root
    required property string icon
    required property bool is_active

    required property var toggle

    readonly property string color_off: Colors.background
    readonly property string color_on: Colors.foreground

    readonly property string color_bg: Colors.background
    readonly property string color_fg: Colors.foreground

    width: 38
    height: 38

    radius: 100

    color: root.color_bg

    Text {
        text: root.icon

        color: root.color_fg
        font: ({
                family: root.font_family,
                pixelSize: 15,
                bold: true
            })
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouse_area
        anchors.fill: root
        onPressed: function () {
            root.toggle(root.is_active);
        }
    }
}
