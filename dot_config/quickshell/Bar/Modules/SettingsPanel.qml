import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../Utils" as Utils
import "root:/"

import Quickshell.Io
import Quickshell.Services.Mpris

Rectangle {
    color: Colors.background
    border {
        color: Colors.foreground
        width: 2
    }
    radius: 20
    width: 310
    height: 170
    Rectangle {

        color: "transparent"
        width: 300
        height: 100
        ColumnLayout {

            anchors {
                fill: parent
                margins: Theme.dashboard_margin
            }

            ColumnLayout {
                spacing: parent.spacing / 2

                SliderWidget {
                    id: slider_brightness

                    Layout.fillWidth: true

                    use_prefix: true
                    prefix: WindowManager.brightness_icon

                    slider.value: WindowManager.brightness

                    slider.onMoved: function () {
                        WindowManager.set_brightness(slider_brightness.slider.value);
                    }
                }

                SliderWidget {
                    id: speaker_volume

                    Layout.fillWidth: true

                    use_prefix: true
                    prefix: WindowManager.is_speaker_muted ? "󰝟" : WindowManager.volume_speaker_icon

                    slider.value: WindowManager.volume_speaker

                    slider.onMoved: function () {
                        WindowManager.set_volume_speaker(speaker_volume.slider.value);
                    }
                }

                SliderWidget {
                    id: mic_volume
                    Layout.fillWidth: true
                    use_prefix: true
                    prefix: WindowManager.is_mic_muted ? "󰍭" : WindowManager.volume_mic_icon
                    slider.value: WindowManager.volume_mic
                    slider.onMoved: function () {
                        WindowManager.set_volume_mic(mic_volume.slider.value);
                    }
                }
            }
        }
    }
    Rectangle {
        height: 30
        width: parent.width
        color: "transparent"
        anchors {
            margins: 20
            bottom: parent.bottom
        }

        GridLayout {
            id: toggle_grid
            columnSpacing: Theme.dashboard_toggle_spacing
            rowSpacing: Theme.dashboard_toggle_spacing
            flow: GridLayout.LeftToRight
            layoutDirection: GridLayout.LeftToRight
            columns: 5

            property bool is_night_light: false
            anchors.centerIn: parent

            DashboardToggle {
                icon: WindowManager.is_speaker_muted ? "󰝟" : "󰕾"
                is_active: !WindowManager.is_speaker_muted
                toggle: function () {
                    WindowManager.toggle_speaker_mute();
                }
            }

            DashboardToggle {
                icon: WindowManager.is_mic_muted ? "󰍭" : "󰍬"
                is_active: !WindowManager.is_mic_muted
                toggle: function () {
                    WindowManager.toggle_mic_mute();
                }
            }

            DashboardToggle {
                icon: Utils.NotifServer.dnd ? "󰂚" : "󰂛"
                is_active: Utils.NotifServer.dnd
                toggle: function () {
                    Utils.NotifServer.dnd = !Utils.NotifServer.dnd;
                }
            }
        }
    }
}
