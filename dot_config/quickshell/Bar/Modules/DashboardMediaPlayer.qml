import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris
import "root:/"

Rectangle {
    id: root

    readonly property int widget_spacing: 10

    Layout.preferredWidth: parent.width
    Layout.preferredHeight: Theme.media_player_height + (Theme.media_player_padding * 2)

    color:Colors.bg0
    radius: Theme.bar_widget_widget_rounding

    clip: true

    RowLayout {
        spacing: 5
        anchors.fill: parent
        anchors.centerIn: parent

        Rectangle {
            id: title_rect

            Layout.preferredWidth: parent.width/4
            Layout.fillHeight: true

            color: "transparent"

            clip: true

            Text {
                id: title_txt

                anchors.verticalCenter: parent.verticalCenter

                text: modelData.trackTitle

                color: Colors.accentActive

                font: ({
                    family: Theme.font_family,
                    pixelSize: 10,
                    bold: true,
                })
            }
        }

        Item {
            Layout.fillWidth: true
        }

        SliderWidget {
            id: duration

            Layout.preferredWidth: parent.width / 2

            color_bg: Colors.bg0

            show_value: false

            slider.from: 0
            slider.to: modelData.length
            slider.value: modelData.position

            slider.onMoved: function() {
                modelData.position = duration.slider.value
            }

            slider.enabled: modelData.canSeek
        }

        Timer {
            interval: 200
            running: true
            repeat: true
            onTriggered: function() {
                if (!duration.slider.pressed) {
                    duration.slider.value = modelData.position
                }
            }
        }

        Item {
            Layout.preferredWidth: root.widget_spacing
        }

        RowLayout {
            spacing: 5

            DashboardMediaPlayerButton {
                text: "󰒮"
                on_click: function() { modelData.previous() }
            }

            DashboardMediaPlayerButton {
                text: modelData.isPlaying ? "󰏤" : "󰐊"
                on_click: function() { modelData.togglePlaying() }
            }

            DashboardMediaPlayerButton {
                text: "󰒭"
                on_click: function() { modelData.next() }
            }
        }
    }
}
