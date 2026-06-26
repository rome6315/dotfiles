import Quickshell
import Quickshell.Io
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts
import qs.Matugen

Item {
    implicitWidth: root.implicitWidth
    implicitHeight: root.implicitHeight
    RowLayout {
        id: root
        spacing: 6

        property var wifiDevice: Networking.devices.values.find(d => d.type === DeviceType.Wifi) // find the Wifi device
        property var active: wifiDevice ? wifiDevice.networks.values.find(n => n.connected) : null // find the SSID connected to

        readonly property real signal: active ? active.signalStrength : 0 // get signal strength

        // define icons for different states
        readonly property string icon: {
            if (!Networking.wifiEnabled)
                return String.fromCodePoint(0xF05AA);
            if (!active)
                return String.fromCodePoint(0xF092D);

            let tier = signal >= 0.75 ? 4 : signal >= 0.50 ? 3 : signal >= 0.25 ? 2 : 1;

            return String.fromCodePoint(0xF091F + (tier - 1) * 3);
        }

        // format icon
        Text {
            text: root.icon
            color: Networking.wifiEnabled ? Colors.md3.tertiary : Colors.md3.error

            font {
                family: "Iosevka Nerd Font Bold"
                pixelSize: 20
            }
        }

        // format SSID text
        // Text {
        //     text: {
        //         if (!Networking.wifiEnabled)
        //             return "Off";
        //         if (!root.active)
        //             return "Disconnected";

        //         return root.active.name;
        //     }

        //     color: Colors.md3.tertiary

        //     font {
        //         family: "Iosevka Nerd Font Bold"
        //         pixelSize: 17
        //         weight: 600
        //     }
        // }
    }

    // launch nmtui
    Process {
        id: wiremix
        command: ["kitty", "--class=kittyfloat", "nmtui"]
    }

    // make module clickable to show nmtui
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor // make cursor switch to the hand

        onClicked: {
            wiremix.running = true;
        }
    }
}
