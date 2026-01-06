import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import "root:/"

RowLayout {
    id: root

    readonly property int rounding: 100

    property string color_bg: Colors.bg1
    property string color_value_bg: Colors.accentActive

    property bool use_prefix: false
    property string prefix: ""

    property bool show_value: true

    property alias slider: slider

    spacing: 5

    Rectangle {
        color: root.color_bg
        radius: root.rounding
        visible: use_prefix
    }

    Rectangle {
        color: "transparent"

        Layout.preferredWidth: Theme.slider_prefix_width

        height: Theme.slider_height

        visible: use_prefix

        Text {
            text: prefix
            visible: use_prefix

            anchors.centerIn: parent

            color: root.color_value_bg

            font: ({
                    family: root.font_family,
                    pixelSize: Theme.slider_height - root.spacing * 2,
                    bold: true
                })
        }
    }

    Slider {
        id: slider

        from: 0
        to: 100
        value: 0

        Layout.fillWidth: true

        height: 20

        background: Rectangle {
            id: slider_bg_rect

            color: Colors.bg2

            radius: root.rounding

            Text {
                id: value_txt

                text: Math.round(slider.value)

                visible: root.show_value

                anchors.centerIn: slider_bg_rect

                color: root.color_value_bg

                font: ({
                        family: root.font_family,
                        pixelSize: Theme.slider_height / 2,
                        bold: true
                    })
            }

            Rectangle {
                width: slider.visualPosition * slider.width - 5
                height: (slider.height > width) ? width : slider.height
                anchors.verticalCenter: parent.verticalCenter
                color: root.color_value_bg
                radius: root.rounding

                clip: true

                Text {
                    text: value_txt.text

                    visible: root.show_value

                    x: value_txt.x
                    y: value_txt.y

                    color: root.color_bg

                    font: ({
                            family: root.font_family,
                            pixelSize: Theme.slider_height / 2,
                            bold: true
                        })
                }
            }
        }

        handle: Item {
            visible: false
        }
    }
}
