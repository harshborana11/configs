import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import "../../"

Rectangle {
    id: root
    color: Colors.background
    required property var panelWindow
    implicitHeight: 38
    implicitWidth: 40*3
    radius: 100
    anchors {
        right : parent.right
        verticalCenter: parent.verticalCenter
        margins: 130
    }
    Layout.fillWidth: true
    RowLayout {
        id: systray

        spacing: 5

        anchors.fill: parent
        anchors.margins: 10

        Repeater {
            model: SystemTray.items

            delegate: Rectangle {
                id: systray_icon_rect

                width: 20
                height: 20

                color: "transparent"

                Image {
                    source: modelData.icon

                    anchors.fill: parent
                    MouseArea {
                        anchors.fill: parent

                        acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton

                        onPressed: mouse => {
                            if (mouse.button == Qt.LeftButton) {
                                modelData.activate();
                            } else if (mouse.button == Qt.MiddleButton) {
                                modelData.secondaryActivate();
                            } else if (mouse.button == Qt.RightButton) {
                                modelData.display(root.panelWindow, root.parent.width -100 , 50);
                            }
                        }
                    }
                }
            }
        }

        Item {
            Layout.fillWidth: true
        }
    }
}
