import Quickshell
import QtQuick
import Quickshell.Io
import qs.Matugen

Item {
    implicitWidth: powerIcon.implicitWidth
    implicitHeight: powerIcon.implicitHeight
    Text {
        id: powerIcon
        text: String.fromCodePoint(0xF08C7)
        color: Colors.md3.primary

        font {
            family: "Iosevka Nerd Font Bold"
            pixelSize: 20
        }
    }

    // command to launch rofi powermenu
    Process {
        id: powerMenu
        command: ["rofi", "-show", "power-menu", "-modi", "power-menu:" + Quickshell.env("HOME") + "/.local/bin/powermenu"]
    }

    // make module clickable to show the powermenu
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor // make cursor switch to the hand

        onClicked: {
            powerMenu.running = true;
        }
    }
}
