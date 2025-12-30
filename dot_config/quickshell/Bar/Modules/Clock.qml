import QtQuick
import "../../Utils" as Utils
import "../../"

Rectangle {
    color: Colors.background
    implicitHeight: 38
    implicitWidth: 70
    radius: 100
    anchors {
        verticalCenter: parent.verticalCenter
        right: parent.right
    }
    Text {
        id: clockText
        text: `${Utils.Datetime.time}`
        color: Colors.color6
        font.pixelSize: 18
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
    }
}
