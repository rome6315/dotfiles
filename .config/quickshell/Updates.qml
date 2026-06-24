import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Matugen

Item {
    required property var service // passed in from shell.qml from the UpdatesService.qml file

    RowLayout {
        id: row
        spacing: 5

        // format icon
        Text {
            text: String.fromCodePoint(0xF03D5)
            color: Colors.md3.tertiary

            font {
                family: "Iosevka Nerd Font Bold"
                pixelSize: 20
            }
        }

        // format text that shows # of updates
        Text {
            text: service.count
            color: Colors.md3.tertiary

            font {
                family: "Iosevka Nerd Font Bold"
                pixelSize: 17
                weight: 600
            }
        }
    }

    // needed for module to be centered in the bar
    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: updatesPopup.visible = !updatesPopup.visible
    }
}
