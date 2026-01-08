import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../"

Rectangle {
    id: root
    required property var notification
    anchors.fill: parent
    color: Colors.bg1
    border.color: Colors.foreground
    radius: Theme.bar_rounding

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Theme.bar_side_margin

        spacing: 5
        RowLayout {
            Layout.fillWidth: true
            height: Theme.notif_title_height + Theme.notif_txt_margin
            spacing: 5
            Rectangle {
                id: head
                Layout.fillWidth: true
                height: parent.height

                color: Colors.bg2

                radius: Theme.bar_widget_rounding

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: Theme.notif_txt_margin

                    color: "transparent"

                    clip: true

                    Text {
                        id: head_txt

                        text: notification.summary

                        anchors.verticalCenter: parent.verticalCenter

                        color: Colors.foreground

                        font: ({
                                family: Theme.font_family,
                                pixelSize: Theme.notif_head_font_size,
                                bold: true
                            })
                    }
                }
            }

            Rectangle {
                id: close_button

                Layout.preferredWidth: parent.height
                height: parent.height

                color: Colors.foreground

                radius: Theme.bar_widget_rounding

                Text {
                    id: close_button_txt

                    text: ""

                    Component.onCompleted: function () {
                        if (notification.urgency == 2) {
                            this.text = "";
                            close_button.color = Colors.color2;
                        }
                    }

                    anchors.centerIn: parent

                    color: Colors.background

                    font: ({
                            family: Theme.font_family,
                            pixelSize: close_button.height - 12,
                            bold: true
                        })
                }

                MouseArea {
                    anchors.fill: parent

                    onPressed: function () {
                        notification.dismiss();
                    }
                }
            }
        }

        Rectangle {
            id: body

            Layout.fillWidth: true
            Layout.fillHeight: true

            color: "transparent"

            Rectangle {
                anchors.fill: parent
                anchors.margins: Theme.notif_txt_margin
                color: "transparent"

                clip: true

                Text {
                    id: body_txt

                    width: parent.width

                    text: notification.body

                    color: Colors.foreground

                    wrapMode: Text.Wrap

                    font: ({
                            family: Theme.font_family,
                            pixelSize: Theme.notif_body_font_size,
                            bold: true
                        })
                }
            }
        }
    }
}
