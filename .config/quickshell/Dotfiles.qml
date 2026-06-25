import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Matugen

Item {
    required property var service // passed in from shell.qml from the DotfilesService.qml file

    RowLayout {
        id: row
        spacing: 5

        // format icon
        Text {
            text: String.fromCodePoint(0xF02A4)
            color: Colors.md3.primary

            font {
                family: "Iosevka Nerd Font Bold"
                pixelSize: 20
            }
        }

        // format the text that shows # of unstaged files
        Text {
            text: service.dirty ? service.unstagedCount : "Clean"

            color: Colors.md3.primary

            font {
                family: "Iosevka Nerd Font Bold"
                pixelSize: 17   // text size
                weight: 600
            }
        }
    }

    // needed for module to be centered in the bar
    implicitWidth: row.implicitWidth
    implicitHeight: row.implicitHeight

    MouseArea {
        anchors.fill: parent
        cursorShape: service.unstagedCount > 0 ? Qt.PointingHandCursor : Qt.ArrowCursor

        onClicked: {
            if (service.unstagedCount > 0)
                dotfilesPopup.visible = !dotfilesPopup.visible;
        }
    }
}
