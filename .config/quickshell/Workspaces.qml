import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.Matugen

// container that holds the workspaces
RowLayout {
    id: root

    required property var screen // monitor passed in from shell.qml
    property var monitor: Hyprland.monitorFor(screen) // maps the screen to Hyprland's internal monitor object

    spacing: 6 // margin between workspace pills

    Repeater {
        model: Hyprland.workspaces.values.filter(ws => ws.monitor?.id === root.monitor?.id) // create and filter workspaces that belong to the specific monitor i.e (1-3 on DP-1, 4-6 on DP-2)

        // rectangle is how each pill will look
        Rectangle {
            required property var modelData // variable to ensure each workspace is assigned an id
            property var ws: modelData // alias for the above variable

            property bool isActive: Hyprland.focusedWorkspace?.id === ws.id // check if a workspace is active

            implicitWidth: (label.implicitWidth + 14) * (isActive ? 2.5 : 1) // first set is inactive workspaces pill width, second set is active pill workspace width
            implicitHeight: 8 // height of the pill
            radius: 3 // radius of the pill

            color: isActive ? Colors.md3.tertiary : Colors.md3.surface_variant // first is active color, second is inactive color

            // whenever width of a pill  changes (active workspace), animate it
            Behavior on implicitWidth {
                NumberAnimation {
                    duration: 250
                    easing.type: Easing.OutCubic
                }
            }

            Text {
                id: label
                anchors.centerIn: parent

                // Uncomment if you want workspace numbers visible
                // text: ws.id

                // color: isActive
                //     ? Colors.md3.surface_variant
                //     : Colors.md3.tertiary

                // font {
                //     family: "Iosevka Nerd Font Bold"
                //     pixelSize: 15
                //     weight: 600
                // }
            }

            // allow for the workspaces to be clickable
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor

                onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + ws.id + " })")
            }
        }
    }
}
