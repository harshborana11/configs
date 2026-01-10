import QtQuick
import QtQuick.Layouts
import Quickshell
import "root:/"

Rectangle {
    id: root

    required property string text
    required property var on_click

    color: mouse_area.containsMouse ? Colors.foreground : Colors.bg0
    radius: 20

    Layout.preferredHeight: 30
    Layout.preferredWidth: 30

    Text {
        id: txt

        anchors.centerIn: parent

        text: root.text

        color: mouse_area.containsMouse ?  Colors.background : Colors.foreground

        font: ({
            family: Theme.font_family,
            pixelSize: 27,
            bold: true,
        })
    }

    MouseArea {
        id: mouse_area

        anchors.fill: parent

        hoverEnabled: true

        onPressed: function() { root.on_click() }
    }
}
