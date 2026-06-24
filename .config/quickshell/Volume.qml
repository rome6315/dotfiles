import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts
import qs.Matugen

Item {
    implicitWidth: root.implicitWidth
    implicitHeight: root.implicitHeight
    RowLayout {
        id: root
        spacing: 7

        property var sink: Pipewire.defaultAudioSink // current default audio device

        readonly property bool ready: sink && sink.ready // check if the sink exists
        readonly property bool muted: ready && sink.audio.muted // check if the sink is muted
        readonly property int vol: ready ? Math.round(sink.audio.volume * 100) : 0 // get the volume level

        // define icons for the different volume states
        readonly property string icon: {
            if (!ready)
                return String.fromCodePoint(0xF0581);
            if (muted)
                return "󰝟";

            if (vol === 0)
                return String.fromCodePoint(0xF0581);
            if (vol < 34)
                return String.fromCodePoint(0xF057F);
            if (vol < 67)
                return String.fromCodePoint(0xF0580);

            return String.fromCodePoint(0xF057E);
        }

        // format icons
        Text {
            text: root.icon
            color: Colors.md3.primary

            font {
                family: "Iosevka Nerd Font Bold"
                pixelSize: 20
            }
        }

        // format volume level text
        // Text {
        //     text: {
        //         if (!root.ready)
        //             return "-";
        //         if (root.muted)
        //             return "Muted";

        //         return root.vol + "%";
        //     }

        //     color: root.muted ? Colors.md3.error : Colors.md3.primary

        //     font {
        //         family: "Iosevka Nerd Font Bold"
        //         pixelSize: 17
        //         weight: 600
        //     }
        // }

        // track the sink object in pipewrie so quickshell knows when there are changes
        PwObjectTracker {
            objects: [root.sink]
        }
    }

    // command to launch wiremix
    Process {
        id: wiremix
        command: ["kitty", "--class=kittyfloat", "wiremix"]
    }

    // make module clickable to show wiremix
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor // make cursor switch to the hand

        onClicked: {
            wiremix.running = true;
        }
    }
}
